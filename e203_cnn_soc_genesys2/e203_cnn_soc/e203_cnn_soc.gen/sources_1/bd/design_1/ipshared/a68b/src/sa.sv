/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module sa # (SA_ROWS = 3, SA_COLS = 1, IN_WIDTH=8, C_WIDTH=16, QT=1) (
    input                               i_clk                                  ,
    input                               i_rstn                                 ,
    input                               i_ctrl_sa_send_data [SA_COLS-1:0]      ,
    input   [   IN_WIDTH-1: 0]          i_a                 [SA_ROWS-1:0]      ,
    input   [   IN_WIDTH-1: 0]          i_b                 [SA_COLS-1:0]      ,
    input   [    C_WIDTH-1: 0]          i_c                 [SA_COLS-1:0]      ,
    input   [   IN_WIDTH-1: 0]          i_d                 [SA_COLS-1:0]      ,

    output                              o_ctrl_sa_send_data [SA_COLS-1:0]      ,
    output  [   IN_WIDTH-1: 0]          o_a                 [SA_ROWS-1:0]      ,
    output  [   IN_WIDTH-1: 0]          o_b                 [SA_COLS-1:0]      ,
    output  [    C_WIDTH-1: 0]          o_c                 [SA_COLS-1:0]      ,
    output  [   IN_WIDTH-1: 0]          o_d                 [SA_COLS-1:0]
);

logic                        ctrl_sa_send_data [  SA_ROWS:0][SA_COLS-1:0];

logic   [   IN_WIDTH-1: 0]   a_w               [SA_ROWS-1:0][  SA_COLS:0];
logic   [   IN_WIDTH-1: 0]   b_w               [  SA_ROWS:0][SA_COLS-1:0];
logic   [   IN_WIDTH-1: 0]   d_w               [  SA_ROWS:0][SA_COLS-1:0];
logic   [    C_WIDTH-1: 0]   c_w               [  SA_ROWS:0][SA_COLS-1:0];

generate
    for (genvar i = 0; i < SA_ROWS; i++) begin
        assign a_w[i][0] = i_a[i];
        assign o_a[i]  = a_w[i][SA_COLS];
    end
    for (genvar i = 0; i < SA_COLS; i++) begin
        assign b_w[0][i] = i_b[i];
        assign o_b[i]    = b_w[SA_ROWS][i];
        assign c_w[0][i] = i_c[i];
        assign o_c[i]    = c_w[SA_ROWS][i];
        assign d_w[0][i] = i_d[i];
        assign o_d[i]    = d_w[SA_ROWS][i];
        assign ctrl_sa_send_data[0][i] = i_ctrl_sa_send_data[i];
        assign o_ctrl_sa_send_data[i]  = ctrl_sa_send_data[SA_ROWS][i];
    end
endgenerate

generate
    for (genvar r = 0; r < SA_ROWS; r++) begin
        for (genvar c = 0; c < SA_COLS; c++) begin
            pe # (
    .IN_WIDTH                           (IN_WIDTH                  ),
    .C_WIDTH                            (C_WIDTH                   ),
    .QT                                 (QT                        ) 
            ) u_pe (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_ctrl_sa_send_data                (ctrl_sa_send_data[r][c]   ),
    .i_a                                (a_w[r][c]                 ),
    .i_b                                (b_w[r][c]                 ),
    .i_c                                (c_w[r][c]                 ),
    .i_d                                (d_w[r][c]                 ),
    .o_ctrl_sa_send_data                (ctrl_sa_send_data[r+1][c] ),
    .o_a                                (a_w[r][c+1]               ),
    .o_b                                (b_w[r+1][c]               ),
    .o_c                                (c_w[r+1][c]               ),
    .o_d                                (d_w[r+1][c]               )
            );
        end
    end
endgenerate

endmodule