/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module output_buffer # (QUEUE_NUM=1, QUEUE_LEN=3, C_WIDTH=16) (
    input                               i_clk                                               ,
    input                               i_rstn                                              ,
    input                               i_ctrl_ob_data_in                                   ,
    input        [  C_WIDTH-1: 0]       i_data              [QUEUE_NUM-1:0]                 ,

    output                              o_post_valid                                        ,
    input                               i_post_ready                                        ,
    output       [  C_WIDTH-1: 0]       o_data              [QUEUE_NUM-1:0] [QUEUE_LEN-1:0] ,
    output                              o_ob_empty                                          
);

wire post_fire = o_post_valid & i_post_ready;

logic [QUEUE_NUM-1:0] empty;
logic [QUEUE_NUM-1:0] full; 
logic                 all_empty;
logic                 all_full;
logic [  C_WIDTH-1:0] data_t    [QUEUE_NUM-1:0] [QUEUE_LEN-1:0];

assign all_empty = &empty;
assign all_full  = &full;

generate
    for (genvar i = 0; i < QUEUE_NUM; i++) begin
        MultiReadPortFIFO # (
            .DEPTH                              (QUEUE_LEN                 ),
            .WIDTH                              (C_WIDTH                   ) 
        ) u_ob_row (
            .i_clk                              (i_clk                     ),
            .i_rstn                             (i_rstn                    ),
            .i_enq                              (i_ctrl_ob_data_in         ),
            .i_deq                              (post_fire                 ),
            .i_data                             (i_data[i]                 ),
            .o_data                             (data_t[i]                 ),
            .empty                              (empty[i]                  ),
            .full                               (full[i]                   ) 
        );
    end
endgenerate

generate
    for (genvar i = 0; i < QUEUE_NUM; i++) begin
        for (genvar j = 0; j < QUEUE_LEN; j++) begin
            assign o_data[i][j] = data_t[i][QUEUE_LEN-1 -j];
        end
    end
endgenerate

assign o_post_valid = all_full;
assign o_ob_empty = all_empty;

endmodule