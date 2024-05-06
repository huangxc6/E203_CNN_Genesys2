/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module tb_im2col;

    reg                                 i_clk                      ;
    reg                                 i_rst                      ;

    reg                                 i_pre_valid                ;
    wire                                o_pre_ready                ;
    reg                                 i_post_ready               ;
    wire                                o_post_valid               ;

    reg                  [   7: 0]      i_data [ 27: 0]  [ 27: 0]  ;
    wire                 [   7: 0]      o_data [ 25: 0]  [  8: 0]  ;


top_im2col u_top_im2col(
    .i_clk                              (i_clk                     ),
    .i_rst                              (i_rst                     ),
    .i_pre_valid                        (i_pre_valid               ),
    .o_pre_ready                        (o_pre_ready               ),
    .o_post_valid                       (o_post_valid              ),
    .i_post_ready                       (i_post_ready              ),
    .i_data                             (i_data                    ),
    .o_data                             (o_data                    ) 
);

integer i, j;

always #5 i_clk = ~i_clk;

initial begin
    i_clk = 0;  i_rst = 0; i_pre_valid = 0; i_post_ready = 0;   #5  
                i_rst = 1;                                      #15 
                i_rst = 0; i_pre_valid = 1; i_post_ready = 1;
end

initial begin
    for (i = 0; i < 28; i++) begin
        for (j = 0; j < 28; j++) begin
            i_data[i][j] = j;
        end
    end
    #100
    $finish;
end


endmodule