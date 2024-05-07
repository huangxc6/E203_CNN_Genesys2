/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module controller # (INA_ROWS=3, INA_COLS=9, SA_ROWS = 3, SA_COLS = 1) (
    input                               i_clk                      ,
    input                               i_rstn                     ,
    input                               i_ibh_data_in_done         ,
    input                               i_ibv_data_in_done         ,
    input                               i_ob_empty                 ,
    output                              o_ib_data_out              ,
    output                              o_ob_data_in               ,
    output                              o_sa_send_data             ,
    output                              o_sa_is_idle                 
);

logic ctrl_ib_data_out;
logic delay_ctrl_ib_data_out;
logic ctrl_ib_data_out_edge;

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        delay_ctrl_ib_data_out <= 1'b0;
    end else begin
        delay_ctrl_ib_data_out <= ctrl_ib_data_out;
    end
end

assign ctrl_ib_data_out_edge = ctrl_ib_data_out & !delay_ctrl_ib_data_out;
assign o_ib_data_out = ctrl_ib_data_out_edge;

logic cal_done;
logic out_done;
logic cal_gc_start;
logic cal_gc_tick;
logic out_gc_start;
logic out_gc_tick;

localparam S_IDLE = 2'b00;
localparam S_COMPUTE = 2'b01;
localparam S_STALL = 2'b10;
localparam S_OUTPUT = 2'b11;

logic [ 1: 0]  state   ;

wire state_idle = state == S_IDLE, state_compute = state == S_COMPUTE, state_stall = state == S_STALL, state_output = state == S_OUTPUT;

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        state <= S_IDLE;
    end else begin
        case (state)
            S_IDLE   : if (i_ibh_data_in_done & i_ibv_data_in_done & !state_stall) state <= S_COMPUTE;
            S_COMPUTE: if (cal_done & i_ob_empty) state <= S_OUTPUT; else if (cal_gc_tick & !i_ob_empty) state <= S_STALL;
            S_STALL  : if (i_ob_empty) state <= S_OUTPUT;
            S_OUTPUT : if (out_done) state <= S_IDLE;
        endcase
    end
end

assign cal_gc_start = state_idle & i_ibh_data_in_done & i_ibv_data_in_done & !state_stall;
assign ctrl_ib_data_out = state_idle & i_ibh_data_in_done & i_ibv_data_in_done & !state_stall;

tick_generator # (
    .MAX_COUNT                          (INA_COLS+INA_ROWS+SA_COLS-2) 
) u_cal_done_gen (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .start                              (cal_gc_start              ),
    .tick                               (cal_gc_tick               ) 
);

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        cal_done <= 1'b0;
    end else if (cal_gc_tick) begin
        cal_done <= 1'b1;
    end else if (state_output & out_done) begin
        cal_done <= 1'b0;
    end
end


assign out_gc_start = cal_gc_tick & i_ob_empty | state_stall & i_ob_empty;

tick_generator # (
    .MAX_COUNT                          (SA_ROWS-1                 ) 
) u_out_done_gen (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .start                              (out_gc_start              ),
    .tick                               (out_gc_tick               ) 
);

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        out_done <= 1'b0;
    end else if (out_gc_tick) begin
        out_done <= 1'b1;
    end else if (state_output & out_done) begin
        out_done <= 1'b0;
    end
end

assign o_ob_data_in   = cal_done & !out_done & !state_stall;
assign o_sa_send_data = cal_done & !out_done & !state_stall;
assign o_sa_is_idle    = state_idle;


endmodule


module tick_generator # (MAX_COUNT=11) (
    input                               i_clk                      ,
    input                               i_rstn                     ,
    input                               start                      ,
    output                              tick                       
);

logic [$clog2(MAX_COUNT+1) : 0] count;
logic                           enable;

assign tick = count == MAX_COUNT & enable;

always @ (posedge i_clk) begin
    if (!i_rstn)
        enable <= 1'b0;
    else if (start)
        enable <= 1'b1;
    else if (tick)
        enable <= 1'b0;
end

always @ (posedge i_clk) begin
    if (!i_rstn)
        count <= 1'b0;
    else if (enable) begin
        if (count == MAX_COUNT) begin
            count <= 0;
        end else begin
            count <= count + 1'b1;
        end
    end
end

endmodule