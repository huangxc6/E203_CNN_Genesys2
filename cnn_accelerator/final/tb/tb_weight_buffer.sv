/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module tb_weight_buffer;
    reg                                 i_clk                      ;
    reg                                 i_rst                      ;
    reg                [   1: 0]        i_addr                     ;
    reg                [   7: 0]        i_weight [ 9: 0]  [  8: 0] ;
    wire               [   7: 0]        o_weight [ 9: 0]  [  2: 0] ;

fc_weight_buffer u_fc_weight_buffer(
    .i_clk                              (i_clk                     ),
    .i_rst                              (i_rst                     ),
    .i_addr                             (i_addr                    ),
    .i_weight                           (i_weight                  ),
    .o_weight                           (o_weight                  ) 
);

always #5 i_clk = ~i_clk;

initial begin
    i_clk = 0;  i_rst = 0;  #5  
                i_rst = 1;  #15 
                i_rst = 0; 
end

integer i, j;

initial begin
    i_addr = 0;
    for (i = 0; i < 10; i++) begin
        for (j = 0; j < 9; j++) begin
            i_weight[i][j] = i + j;
        end
    end
    #30
    i_addr = 1;
    #30
    i_addr = 2;
    #1000
    $finish;
end

endmodule