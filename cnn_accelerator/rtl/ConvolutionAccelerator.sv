module ConvolutionAccelerator (
    input             valid                     ,
    input      [7:0]  col_data [0:9*26*26-1]    , 
    input      [7:0]  kernel   [0:3*3-1]        ,
    input      [7:0]  bias                      , 
    output     [15:0] conv_result [0:26*26-1]   , 
    input             clk                       ,
    input             reset                     ,
    output reg        conv_done
);
    logic [4:0]  cnt ;

    // combine the results from 26 to 1
    logic [15:0] conv_result_com [0:26*1-1][0:26*1-1];
    genvar i ;
    generate
        for (i = 0; i < 26; i = i + 1) begin
            assign conv_result[i*26: (i+1)*26 - 1] = conv_result_com[i];
        end
    endgenerate

    // split the input data
    logic [7:0] col_data_spl [0:26*1-1][0:9*26*1-1];

    genvar j;
    generate
        for (j = 0; j < 26; j = j + 1) begin
            assign col_data_spl[j] = col_data[j*26*9: (j+1)*26*9 - 1];
        end
    endgenerate

    // data for PE in each clock cycle
    logic [7:0] col_data_tmp [0:9*26*1-1];
    always_comb begin
        case (cnt)
            5'b00000: col_data_tmp = col_data_spl[0];
            5'b00001: col_data_tmp = col_data_spl[1];
            5'b00010: col_data_tmp = col_data_spl[2];
            5'b00011: col_data_tmp = col_data_spl[3];
            5'b00100: col_data_tmp = col_data_spl[4];
            5'b00101: col_data_tmp = col_data_spl[5];
            5'b00110: col_data_tmp = col_data_spl[6];
            5'b00111: col_data_tmp = col_data_spl[7];
            5'b01000: col_data_tmp = col_data_spl[8];
            5'b01001: col_data_tmp = col_data_spl[9];
            5'b01010: col_data_tmp = col_data_spl[10];
            5'b01011: col_data_tmp = col_data_spl[11];
            5'b01100: col_data_tmp = col_data_spl[12];
            5'b01101: col_data_tmp = col_data_spl[13];
            5'b01110: col_data_tmp = col_data_spl[14];
            5'b01111: col_data_tmp = col_data_spl[15];
            5'b10000: col_data_tmp = col_data_spl[16];
            5'b10001: col_data_tmp = col_data_spl[17];
            5'b10010: col_data_tmp = col_data_spl[18];
            5'b10011: col_data_tmp = col_data_spl[19];
            5'b10100: col_data_tmp = col_data_spl[20];
            5'b10101: col_data_tmp = col_data_spl[21];
            5'b10110: col_data_tmp = col_data_spl[22];
            5'b10111: col_data_tmp = col_data_spl[23];
            5'b11000: col_data_tmp = col_data_spl[24];
            5'b11001: col_data_tmp = col_data_spl[25];
            default: col_data_tmp = col_data_tmp;
        endcase
    end

    integer k;
    // results from PE in each clock cycle 
    logic [15:0] conv_result_tmp [0:26*1-1];
    always_comb begin
            case (cnt)
                5'b00000: conv_result_com[0] <= conv_result_tmp;
                5'b00001: conv_result_com[1] <= conv_result_tmp;
                5'b00010: conv_result_com[2] <= conv_result_tmp;
                5'b00011: conv_result_com[3] <= conv_result_tmp;
                5'b00100: conv_result_com[4] <= conv_result_tmp;
                5'b00101: conv_result_com[5] <= conv_result_tmp;
                5'b00110: conv_result_com[6] <= conv_result_tmp;
                5'b00111: conv_result_com[7] <= conv_result_tmp;
                5'b01000: conv_result_com[8] <= conv_result_tmp;
                5'b01001: conv_result_com[9] <= conv_result_tmp;
                5'b01010: conv_result_com[10] <= conv_result_tmp;
                5'b01011: conv_result_com[11] <= conv_result_tmp;
                5'b01100: conv_result_com[12] <= conv_result_tmp;
                5'b01101: conv_result_com[13] <= conv_result_tmp;
                5'b01110: conv_result_com[14] <= conv_result_tmp;
                5'b01111: conv_result_com[15] <= conv_result_tmp;
                5'b10000: conv_result_com[16] <= conv_result_tmp;
                5'b10001: conv_result_com[17] <= conv_result_tmp;
                5'b10010: conv_result_com[18] <= conv_result_tmp;
                5'b10011: conv_result_com[19] <= conv_result_tmp;
                5'b10100: conv_result_com[20] <= conv_result_tmp;
                5'b10101: conv_result_com[21] <= conv_result_tmp;
                5'b10110: conv_result_com[22] <= conv_result_tmp;
                5'b10111: conv_result_com[23] <= conv_result_tmp;
                5'b11000: conv_result_com[24] <= conv_result_tmp;
                5'b11001: conv_result_com[25] <= conv_result_tmp;
                default: conv_result_com <= conv_result_com;
            endcase
        end

    PE pe (
        .col_data(col_data_tmp),
        .kernel(kernel),
        .bias(bias),
        .conv_result(conv_result_tmp)
        // .clk(clk),
        // .reset(reset)
    );

    always @(posedge clk) begin
        if (reset) begin
            cnt <= 5'b0;
        end
        else begin
            if (valid == 1'b1) begin
                cnt <= cnt + 1'b1;    
            end else  if (cnt == 5'b11001) begin
                cnt <= 5'b0;
            end
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            conv_done <= 1'b0;
        end
        else begin
            if (cnt == 5'b11001) begin
                conv_done <= 1'b1;
            end;
        end
    end

endmodule

// complete the convolution in 4 clock cycles
// 26*26*9 = 6084 
// 26*26 = 13 * 13 * 4 = 676
module PE (
    input [7:0] col_data [0:9*26*1-1], 
    input [7:0] kernel [0:3*3-1],
    input [7:0] bias, 
    output [15:0] conv_result [0:26*1-1]
    // input clk,
    // input reset
);
    integer k;
    genvar i, j;

    logic [15:0] conv_sum [0:9*26*1-1];

    generate
        for (i = 0; i < 26*1; i = i + 1) begin
            for (j = 0; j < 3*3; j = j + 1) begin
                assign conv_sum[i*9 + j] = col_data[i*9 + j] * kernel[j];
            end
            assign conv_result[i] = conv_sum[i*9+0] + conv_sum[i*9+1] + conv_sum[i*9+2] + conv_sum[i*9+3] + conv_sum[i*9+4] + conv_sum[i*9+5] + conv_sum[i*9+6] + conv_sum[i*9+7] + conv_sum[i*9+8] + bias; 
            end
    endgenerate
    
endmodule
