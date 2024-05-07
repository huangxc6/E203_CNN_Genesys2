
module conv_pe # (INA_ROWS=26, INA_COLS=9, INB_ROWS=1, INB_COLS=9, SA_ROWS=26, SA_COLS=1, IN_WIDTH=8, C_WIDTH=32, QT=1) (
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

    wire pre_fire  = i_pre_valid & o_pre_ready;
    wire post_fire = o_post_valid & i_post_ready;

    assign o_pre_ready =  o_post_valid & i_post_ready | !o_post_valid ;

   lib_reg #(
    .WIDTH                              (1                         ),
    .RESET_VAL                          (0                         ) 
    ) postvalid (
       .clk                                (i_clk                     ),
       .rst                                (i_rstn                    ),
       .wen                                (o_pre_ready               ),
       .din                                (i_pre_valid               ),
       .dout                               (o_post_valid              ));

    logic [IN_WIDTH-1: 0] img_conv_data [INA_ROWS-1:0][INA_COLS-1:0];
    assign img_conv_data = i_a;

    logic [IN_WIDTH-1: 0] kernal [INB_ROWS-1:0][INB_COLS-1:0];
    assign kernal = i_b;

    logic [C_WIDTH-1: 0] conv_result_r   [SA_COLS-1:0][SA_ROWS-1:0];  
    logic [C_WIDTH-1: 0] conv_result     [SA_COLS-1:0][SA_ROWS-1:0];
    logic [C_WIDTH-1: 0] conv_result_low [SA_COLS-1:0][SA_ROWS-1:0];   
    logic [C_WIDTH-1: 0] conv_result_high[SA_COLS-1:0][SA_ROWS-1:0];    
 
    assign o_c = conv_result_r;

    logic [C_WIDTH-1: 0] conv_result_tmp [SA_ROWS-1:0][INB_COLS-1:0];

    always @(posedge i_clk) begin
        if (i_rstn == 1'b0) begin
            for (integer i = 0; i < 26; i++) begin
                conv_result_r[0][i] <= 0;    
            end 
        end else if (post_fire) begin
            conv_result_r <= conv_result;
        end 
    end

    wire [C_WIDTH-1: 0] conv_bias ;
    assign conv_bias = i_d[0];

    generate
    for (genvar n = 0; n < 26; n++) begin
        for (genvar i = 0; i < 9; i++) begin
            mac #(
                .IN_WIDTH(IN_WIDTH),
                .C_WIDTH(C_WIDTH),
                .QT(QT)
            ) u_mac (
                .i_a(img_conv_data[n][i]),
                .i_b(kernal[0][i]),
                .i_c(0),
                .o_c(conv_result_tmp[n][i])
            );
        end
        // assign conv_result_low[0][n] = conv_result_tmp[n][0] + conv_result_tmp[n][1] + conv_result_tmp[n][2] + conv_result_tmp[n][3] + conv_result_tmp[n][4] + conv_result_tmp[n][5] + conv_result_tmp[n][6] + conv_result_tmp[n][7] + conv_result_tmp[n][8] + conv_result_tmp[n][9]; 
    end
    endgenerate

    generate
        for (genvar n = 0; n < 26 ; n++ ) begin
            assign conv_result_low[0][n] = conv_result_tmp[n][0] + conv_result_tmp[n][1] + conv_result_tmp[n][2] + conv_result_tmp[n][3] ;
            assign conv_result_high[0][n] = + conv_result_tmp[n][4] + conv_result_tmp[n][5] + conv_result_tmp[n][6] + conv_result_tmp[n][7] + conv_result_tmp[n][8] ;
            assign conv_result[0][n] = conv_result_low[0][n] + conv_result_high[0][n] + conv_bias;
        end
    endgenerate



endmodule

// module mac # (IN_WIDTH=8, C_WIDTH=16, QT=1) (
//     input              [   IN_WIDTH-1: 0]        i_a                        ,
//     input              [   IN_WIDTH-1: 0]        i_b                        ,
//     input              [  C_WIDTH-1: 0]          i_c                        ,
//     output             [  C_WIDTH-1: 0]          o_c                         
// );
// logic [IN_WIDTH-1:0] mul_res_unsigned;
// wire qt = QT;

// assign mul_res_unsigned = i_a * i_b;
// assign o_c = qt? (mul_res_unsigned + i_c) : i_a * i_b + i_c;

// endmodule