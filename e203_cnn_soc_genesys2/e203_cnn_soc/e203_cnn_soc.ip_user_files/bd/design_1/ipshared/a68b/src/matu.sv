/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module matu # (INA_ROWS=3, INA_COLS=9, INB_ROWS=1, INB_COLS=9, SA_ROWS=3, SA_COLS=1, IN_WIDTH=8, C_WIDTH=16, QT=1) (
    input                               i_clk                                       ,
    input                               i_rstn                                      ,

    input                               i_pre_valid                                 ,
    output                              o_pre_ready                                 ,
    input                               i_post_ready                                ,
    output                              o_post_valid                                ,


    input          [  IN_WIDTH-1: 0]    i_a             [INA_ROWS-1:0][INA_COLS-1:0],
    input          [  IN_WIDTH-1: 0]    i_b             [INB_ROWS-1:0][INB_COLS-1:0],
    input          [  IN_WIDTH-1: 0]    i_d             [INB_ROWS-1:0]              ,
    output           [ C_WIDTH-1: 0]    o_c             [ SA_COLS-1:0][SA_ROWS-1 :0]
);

logic                   ibh_data_in_done                  ;
logic                   ibh_ready                         ;
logic  [IN_WIDTH-1: 0]  ibh_data            [INA_ROWS-1:0];

logic                   ibv_ready                         ;
logic                   ibv_data_in_done                  ;
logic  [IN_WIDTH-1: 0]  ibv_data            [INB_ROWS-1:0];

logic  [ C_WIDTH-1: 0]  sa_res              [ SA_COLS-1:0];

logic                   ob_empty                          ;

logic                   ctrl_ib_data_out                  ;
logic                   ctrl_ob_data_in                   ;
logic                   ctrl_sa_send_data                 ;
logic                   ctrl_sa_is_idle                   ;


logic                   ctrl_sa_send_data_pack  [SA_COLS-1:0];
logic [ C_WIDTH-1: 0]   c_pend                  [SA_COLS-1:0];      

assign o_pre_ready = ibh_ready  & ctrl_sa_is_idle & ob_empty;

generate
    for (genvar i = 0; i < SA_COLS; i++) begin
        assign c_pend[i] = 0;
        assign ctrl_sa_send_data_pack[i] = ctrl_sa_send_data;
    end
endgenerate

controller # (
    .INA_ROWS                           (INA_ROWS                  ),
    .INA_COLS                           (INA_COLS                  ),
    .SA_ROWS                            (SA_ROWS                   ),
    .SA_COLS                            (SA_COLS                   ) 
) u_controller (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_ibh_data_in_done                 (ibh_data_in_done          ),
    .i_ibv_data_in_done                 (ibv_data_in_done          ),
    .i_ob_empty                         (ob_empty                  ),
    .o_ib_data_out                      (ctrl_ib_data_out          ),
    .o_ob_data_in                       (ctrl_ob_data_in           ),
    .o_sa_send_data                     (ctrl_sa_send_data         ),
    .o_sa_is_idle                       (ctrl_sa_is_idle           )
);

input_buffer # (
    .QUEUE_NUM                          (INA_ROWS                  ),
    .QUEUE_LEN                          (INA_COLS                  ),
    .IN_WIDTH                           (IN_WIDTH                  ) 
) u_ibh (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_ctrl_data_out                    (ctrl_ib_data_out          ),
    .i_pre_valid                        (i_pre_valid               ),
    .o_pre_ready                        (ibh_ready                 ),
    .i_data                             (i_a                       ),
    .o_data_in_done                     (ibh_data_in_done          ),
    .o_data                             (ibh_data                  ) 
);

input_buffer # (
    .QUEUE_NUM                          (INB_ROWS                  ),
    .QUEUE_LEN                          (INB_COLS                  ),
    .IN_WIDTH                           (IN_WIDTH                  ) 
) u_ibv (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_ctrl_data_out                    (ctrl_ib_data_out          ),
    .i_pre_valid                        (i_pre_valid               ),
    .o_pre_ready                        (ibv_ready                 ),
    .i_data                             (i_b                       ),
    .o_data_in_done                     (ibv_data_in_done          ),
    .o_data                             (ibv_data                  ) 
);

sa # (
    .SA_ROWS                            (SA_ROWS                   ),
    .SA_COLS                            (SA_COLS                   ),
    .IN_WIDTH                           (IN_WIDTH                  ), 
    .C_WIDTH                            (C_WIDTH                   ),
    .QT                                 (QT                        )
) u_sa (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_ctrl_sa_send_data                (ctrl_sa_send_data_pack    ),
    .i_a                                (ibh_data                  ),
    .i_b                                (ibv_data                  ),
    .i_c                                (c_pend                    ),
    .i_d                                (i_d                       ),
    .o_c                                (sa_res                    ) 
);

output_buffer # (                    
    .QUEUE_NUM                          (SA_COLS                   ),
    .QUEUE_LEN                          (SA_ROWS                   ),
    .C_WIDTH                            (C_WIDTH                   ) 
) u_ob (
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_ctrl_ob_data_in                  (ctrl_ob_data_in           ),
    .i_data                             (sa_res                    ),
    .o_post_valid                       (o_post_valid              ),
    .i_post_ready                       (i_post_ready              ),
    .o_data                             (o_c                       ),
    .o_ob_empty                         (ob_empty                  ) 
);

endmodule