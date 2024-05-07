/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module FIFO #(DEPTH = 9, WIDTH=8) (
    input                               i_clk                      ,
    input                               i_rstn                     ,
    input                               i_enq                      ,
    input                               i_deq                      ,
    input        [    WIDTH-1: 0]       i_data                     ,
    output       [    WIDTH-1: 0]       o_data                     ,
    output                              empty                      ,
    output                              full                        
);

localparam ADDR_WIDTH = $clog2(DEPTH);

logic  [     WIDTH-1:0]    entry_r  [DEPTH-1:0] ;
logic  [ADDR_WIDTH-1:0]    read_ptr             ;
logic  [ADDR_WIDTH-1:0]    write_ptr            ;
logic  [ADDR_WIDTH-1:0]    data_cnt             ;

always @(posedge i_clk) begin
    if(!i_rstn) begin
        data_cnt <= 0;
    end else if (i_enq & (~full) & (~(i_deq & (~empty)))) begin
        data_cnt <= data_cnt + 1;
    end else if (i_deq & (~empty) & (~(i_enq & (~full)))) begin
        data_cnt <= data_cnt - 1;
    end else begin
        data_cnt <= data_cnt;
    end
end

assign empty = data_cnt == 0         ;
assign full  = data_cnt == DEPTH     ;  

// write logic /////////////////////////////////////////////////////////////

generate
    for (genvar i = 0; i < DEPTH; i++) begin
        lib_reg#(
    .WIDTH                              (WIDTH                     ),
    .RESET_VAL                          (0                         ) 
        ) u_entry (
    .clk                                (i_clk                     ),
    .rst                                (i_rstn                    ),
    .din                                (i_data                    ),
    .dout                               (entry_r[i]                ),
    .wen                                (i_enq & write_ptr == i    ) 
        );
    end
endgenerate

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        write_ptr <= 0;
    end else if (i_enq & !full) begin
        if (write_ptr == DEPTH-1) 
            write_ptr <= 0;
        else 
            write_ptr <= write_ptr + 1'b1;
    end
end

// read logic //////////////////////////////////////////////////////////////

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        read_ptr <= 0; 
    end else if (i_deq & !empty) begin
        if (read_ptr == DEPTH-1) 
            read_ptr <= 0;
        else 
            read_ptr <= read_ptr + 1'b1;
    end
end

assign o_data = (i_deq & !empty) ? entry_r[read_ptr] : 0;

endmodule

module MultiWritePortFIFO #(DEPTH = 9, WIDTH=8) (
    input                               i_clk                      ,
    input                               i_rstn                     ,
    input                               i_enq                      ,
    input                               i_deq                      ,
    input        [    WIDTH-1: 0]       i_data  [DEPTH-1:0]        ,
    output       [    WIDTH-1: 0]       o_data                     ,
    output                              empty                      ,
    output                              full                        
);

localparam ADDR_WIDTH = $clog2(DEPTH);

logic  [     WIDTH-1:0]    entry_r  [DEPTH-1:0] ;
logic  [ADDR_WIDTH-1:0]    read_ptr             ;
logic  [ADDR_WIDTH-1:0]    write_ptr            ;
logic  [ADDR_WIDTH-1:0]    data_cnt             ;

always @(posedge i_clk) begin
    if(!i_rstn) begin
        data_cnt <= 0;
    end else if (i_enq & (~full) & (~(i_deq & (~empty)))) begin
        data_cnt <= data_cnt + DEPTH;
    end else if (i_deq & (~empty) & (~(i_enq & (~full)))) begin
        data_cnt <= data_cnt - 1;
    end else begin
        data_cnt <= data_cnt;
    end
end

assign empty = data_cnt == 0         ;
assign full  = data_cnt == DEPTH     ; 

// write logic /////////////////////////////////////////////////////////////

generate
    for (genvar i = 0; i < DEPTH; i++) begin
        lib_reg#(
    .WIDTH                              (WIDTH                     ),
    .RESET_VAL                          (0                         ) 
        ) u_entry (
    .clk                                (i_clk                     ),
    .rst                                (i_rstn                    ),
    .din                                (i_data[i]                 ),
    .dout                               (entry_r[i]                ),
    .wen                                (i_enq                     ) 
        );
    end
endgenerate

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        write_ptr <= 0;
    end else if (i_enq & !full) begin
        write_ptr <= 0;
    end
end

// read logic //////////////////////////////////////////////////////////////

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        read_ptr <= 0; 
    end else if (i_deq & !empty) begin
        if (read_ptr == DEPTH-1) 
            read_ptr <= 0;
        else 
            read_ptr <= read_ptr + 1'b1;
    end
end

assign o_data = (i_deq & !empty) ? entry_r[read_ptr] : 0;

endmodule


module MultiReadPortFIFO #(DEPTH = 9, WIDTH=16) (
    input                               i_clk                      ,
    input                               i_rstn                     ,
    input                               i_enq                      ,
    input                               i_deq                      ,
    input              [   WIDTH-1: 0]       i_data                     ,
    output             [   WIDTH-1: 0]       o_data     [DEPTH-1:0]     ,
    output                              empty                      ,
    output                              full                        
);

localparam ADDR_WIDTH = $clog2(DEPTH);

logic  [     WIDTH-1:0]    entry_r  [DEPTH-1:0] ;
logic  [ADDR_WIDTH-1:0]    read_ptr             ;
logic  [ADDR_WIDTH-1:0]    write_ptr            ;
logic  [ADDR_WIDTH-1:0]    data_cnt             ;

always @(posedge i_clk) begin
    if(!i_rstn) begin
        data_cnt <= 0;
    end else if (i_enq & (~full) & (~(i_deq & (~empty)))) begin
        data_cnt <= data_cnt + 1;
    end else if (i_deq & (~empty) & (~(i_enq & (~full)))) begin
        data_cnt <= data_cnt - DEPTH;
    end else begin
        data_cnt <= data_cnt;
    end
end

assign empty = data_cnt == 0         ;
assign full  = data_cnt == DEPTH     ; 

// write logic /////////////////////////////////////////////////////////////

generate
    for (genvar i = 0; i < DEPTH; i++) begin
        lib_reg#(
    .WIDTH                              (WIDTH                     ),
    .RESET_VAL                          (0                         ) 
        ) u_entry (
    .clk                                (i_clk                     ),
    .rst                                (i_rstn                    ),
    .din                                (i_data                    ),
    .dout                               (entry_r[i]                ),
    .wen                                (i_enq & write_ptr == i    ) 
        );
    end
endgenerate

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        write_ptr <= 0;
    end else if (i_enq & !full) begin
        if (write_ptr == DEPTH-1) 
            write_ptr <= 0;
        else 
            write_ptr <= write_ptr + 1'b1;
    end
end

// read logic //////////////////////////////////////////////////////////////

always @ (posedge i_clk) begin
    if (!i_rstn) begin
        read_ptr <= 0; 
    end else if (i_deq & full) begin
        read_ptr <= 0;
    end
end

generate 
    for (genvar i = 0; i < DEPTH; i++) begin
        assign o_data[i] = (i_deq & full) ? entry_r[i] : 0;
    end
endgenerate

endmodule