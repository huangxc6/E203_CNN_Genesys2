/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module input_buffer # (QUEUE_NUM = 3, QUEUE_LEN = 9, IN_WIDTH=8) (
    input                               i_clk                                              ,
    input                               i_rstn                                             ,

    input                               i_ctrl_data_out                                    ,
    input                               i_pre_valid                                        ,
    output                              o_pre_ready                                        ,
    output      [   IN_WIDTH-1: 0]      i_data            [QUEUE_NUM-1:0] [QUEUE_LEN-1:0]  ,  

    output                              o_data_in_done                                     ,
    output      [   IN_WIDTH-1: 0]      o_data            [QUEUE_NUM-1:0]                  
);

localparam S_PREPARE = 1'b0;
localparam S_DATA_OUT = 1'b1;

wire pre_fire = i_pre_valid & o_pre_ready;

logic [QUEUE_NUM-1:0] empty;
logic [QUEUE_NUM-1:0] full; 
logic                 all_empty;
logic                 all_full;

assign all_empty = &empty;
assign all_full  = &full;

// 2. fsm  state prepare: load data; state data_out: output data ////////////////////////

logic           state;
wire            state_prepare = state == S_PREPARE, state_data_out = state == S_DATA_OUT;

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        state <= S_PREPARE;
    end else begin
        case (state)
            S_PREPARE : if (all_full) state <= i_ctrl_data_out ? S_DATA_OUT : S_PREPARE;
            S_DATA_OUT: if (all_empty) state <= S_PREPARE;
            default   :   ;
        endcase
    end
end

logic [$clog2(QUEUE_NUM)-1:0] delay_cnt [QUEUE_NUM-1:0];

generate
    for (genvar i = 0; i < QUEUE_NUM; i++) begin
        MultiWritePortFIFO # (
            .DEPTH                              (QUEUE_LEN                 ),
            .WIDTH                              (IN_WIDTH                  ) 
        ) u_ib_row (
            .i_clk                              (i_clk                     ),
            .i_rstn                             (i_rstn                    ),
            .i_enq                              (pre_fire                  ),
            .i_deq                              (state_data_out & delay_cnt[i] == 0 & !empty[i]),
            .i_data                             (i_data[i]                 ),
            .o_data                             (o_data[i]                 ),
            .empty                              (empty[i]                  ),
            .full                               (full[i]                   ) 
        );
    end
endgenerate


// 3. delay cnt: support generate output data stream ////////////////////////////////////

generate
    for (genvar i = 0; i < QUEUE_NUM; i++) begin
        always @ (posedge i_clk) begin
            if (!i_rstn)
                delay_cnt[i] <= 0;
            else if (state_prepare)
                delay_cnt[i] <= i;  
            else if (state_data_out)
                delay_cnt[i] <= (delay_cnt[i] == 0) ? 0 : (delay_cnt[i] - 1'b1);
        end
    end
endgenerate

assign o_data_in_done = state_prepare & all_full;

assign o_pre_ready    = state_prepare;

endmodule