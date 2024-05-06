/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module tb_conv_fc;
    reg                                 i_clk                      ;
    reg                                 i_rst                      ;

    reg                                 i_pre_valid                ;
    wire                                o_pre_ready                ;
    reg                                 i_post_ready               ;
    wire                                o_post_valid               ;

    reg           [  7:  0]             i_conv_bias                ;
    reg           [  7:  0]             i_conv_kernel [25:0][8:0]  ;
    reg           [  7:  0]             i_conv_weight [0:0][8:0]   ;
    reg           [  7:  0]             i_fc_weight   [675:0][9:0] ;
    reg           [  7:  0]             i_fc_bias     [9:0]        ;
    wire          [ 31:  0]             o_res         [9:0]        ;    

top_conv_fc u_top_conv_fc(
    .i_clk                              (i_clk                     ),
    .i_rst                              (i_rst                     ),
    .i_pre_valid                        (i_pre_valid               ),
    .o_pre_ready                        (o_pre_ready               ),
    .o_post_valid                       (o_post_valid              ),
    .i_post_ready                       (i_post_ready              ),
    .i_conv_kernel                      (i_conv_kernel             ),
    .i_conv_weight                      (i_conv_weight             ),
    .i_conv_bias                        (i_conv_bias               ),
    .i_fc_weight                        (i_fc_weight               ),
    .i_fc_bias                          (i_fc_bias                 ),
    .o_res                              (o_res                     ) 
);

integer i, j;

always #5 i_clk = ~i_clk;

initial begin
    i_clk = 0;  i_rst = 0; i_pre_valid = 0; i_post_ready = 0;   #5  
                i_rst = 1;                                      #15 
                i_rst = 0; i_pre_valid = 1; i_post_ready = 1;
end

initial begin
    i_conv_bias = 1;
    for (i = 0; i < 26; i++) begin
        for (j = 0; j < 9; j++) begin
            i_conv_kernel[i][j] = i + j;
        end
    end
    for (i = 0; i < 1; i++) begin
        for (j = 0; j < 9; j++) begin
            i_conv_weight[i][j] = i + j;
        end
    end
    for (int i = 0; i < 676; i++) begin
        for (int j = 0; j < 10; j++) begin
            i_fc_weight[i][j] = i + 1;
        end
    end
    for (int i = 0; i < 10; i++) begin
        i_fc_bias[i] = i;
    end
    #1000
    $finish;
end


endmodule