/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module tb_matu;
    reg                                 i_clk                      ;
    reg                                 i_rst                      ;

    reg                                 i_pre_valid                ;
    wire                                o_pre_ready                ;
    reg                                 i_post_ready               ;
    wire                                o_post_valid               ;

    reg                  [   7: 0]      i_a    [  2: 0]  [  8: 0]  ;
    reg                  [   7: 0]      i_b    [  0: 0]  [  8: 0]  ;
    wire                 [  15: 0]      o_c    [  0: 0]  [  2: 0]  ;

matu # (
    .INA_ROWS                           (3                         ),
    .INA_COLS                           (9                         ),
    .INB_ROWS                           (1                         ),
    .INB_COLS                           (9                         ),
    .SA_ROWS                            (3                         ),
    .SA_COLS                            (1                         ),
    .IN_WIDTH                           (8                         ),
    .C_WIDTH                            (16                        )  
) u_matu (
    .i_clk                              (i_clk                     ),
    .i_rst                              (i_rst                     ),
    .i_pre_valid                        (i_pre_valid               ),
    .o_pre_ready                        (o_pre_ready               ),
    .i_post_ready                       (i_post_ready              ),
    .o_post_valid                       (o_post_valid              ),
    .i_a                                (i_a                       ),
    .i_b                                (i_b                       ),
    .o_c                                (o_c                       ) 
);

integer i, j;

always #5 i_clk = ~i_clk;

initial begin
    i_clk = 0;  i_rst = 0; i_pre_valid = 0; i_post_ready = 0;   #5  
                i_rst = 1;                                      #15 
                i_rst = 0; i_pre_valid = 1; i_post_ready = 1;
end

initial begin
    for (i = 0; i < 3; i++) begin
        for (j = 0; j < 9; j++) begin
            i_a[i][j] = i + j;
        end
    end
    for (i = 0; i < 1; i++) begin
        for (j = 0; j < 9; j++) begin
            i_b[i][j] = i + j;
        end
    end
    #1000
    $finish;
end


endmodule