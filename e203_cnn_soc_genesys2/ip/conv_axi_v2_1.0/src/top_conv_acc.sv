/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module top_conv_acc (
    input                               i_clk                      ,
    input                               i_rstn                     ,

    input                               i_start                    ,

    output               [  7: 0]       o_res         
);

logic               im2col_valid                               ;
logic               im2col_ready                               ;
logic   [   7: 0]   im2col_data              [  25: 0][   8: 0];

logic   [   7: 0]   buffer_conv_weight                [   8: 0];
logic   [   7: 0]   buffer_conv_bias                           ;
logic   [   4: 0]   buffer_fc_weight_addr                      ;
logic   [   7: 0]   buffer_fc_weight         [  25: 0][   9: 0];
logic   [   7: 0]   buffer_fc_bias                    [   9: 0];


logic   [   7: 0]   convfc_conv_weight       [   0: 0][   8: 0];    
logic               convfc_valid                               ;
logic               convfc_ready                               ;
logic   [  31: 0]   convfc_res               [   9: 0]         ;

logic               acc_reg_valid                              ;
logic   [  31: 0]   acc_reg_res              [   9: 0]         ;

assign convfc_conv_weight[0] = buffer_conv_weight; 

logic start_r;

always @ (posedge i_clk) begin
    if (!i_rstn)
        start_r <= 1'b0;
    else if (i_start) begin
        start_r <= 1'b1;
    end
end

top_im2col u_top_im2col(
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_pre_valid                        (start_r                   ),
    .o_pre_ready                        (                          ),
    .o_post_valid                       (im2col_valid              ),
    .i_post_ready                       (im2col_ready              ),
    .o_data                             (im2col_data               ) 
);

conv_weight_buffer u_conv_weight_buffer(
    .o_weight                           (buffer_conv_weight        ),
    .o_bias                             (buffer_conv_bias          )
);

fc_weight_buffer u_fc_weight_buffer(
    .i_addr                             (buffer_fc_weight_addr     ),
    .o_weight                           (buffer_fc_weight          ),
    .o_bias                             (buffer_fc_bias            )
);

top_conv_fc u_top_conv_fc(
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_pre_valid                        (im2col_valid              ),
    .o_pre_ready                        (im2col_ready              ),
    .o_post_valid                       (convfc_valid              ),
    .i_post_ready                       (convfc_ready              ),
    .i_conv_kernel                      (im2col_data               ),
    .i_conv_weight                      (convfc_conv_weight        ),
    .i_conv_bias                        (buffer_conv_bias          ),
    .o_fc_weight_addr                   (buffer_fc_weight_addr     ),
    .i_fc_weight                        (buffer_fc_weight          ),
    .i_fc_bias                          (buffer_fc_bias            ),
    .o_res                              (convfc_res                ) 
);

acc_reg u_acc_reg(
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_pre_valid                        (convfc_valid              ),
    .o_pre_ready                        (convfc_ready              ),
    .o_post_valid                       (acc_reg_valid             ),
    .i_post_ready                       (1'b1                      ),
    .i_res                              (convfc_res                ),
    .i_bias                             (buffer_fc_bias            ),
    .o_res                              (acc_reg_res               ) 
);

reorder u_reorder(
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_pre_valid                        (acc_reg_valid             ),
    .i_data                             (acc_reg_res               ),
    .o_max_index                        (o_res                     ) 
);




endmodule 