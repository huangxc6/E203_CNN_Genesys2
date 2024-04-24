module ConvolutionAccelerator (
    input [7:0] col_data [0:8*26*26-1], 
    input [7:0] kernel [0:3*3-1],
    input [7:0] bias, 
    output reg [15:0] conv_result [0:26*26-1], 
    input clk,
    input reset
);
  reg [15:0] conv_sum;
  integer i, j, k;
  always @(posedge clk) begin
    if (reset) begin
        conv_sum <= 0;
        for (i = 0; i < 26*26; i = i + 1) begin
            conv_result[i] <= 0;
        end
    end
    else begin
        for (i = 0; i < 26*26; i = i + 1) begin
            conv_sum <= 0;
            for (j = 0; j < 3*3; j = j + 1) begin
                conv_sum <= conv_sum + col_data[i][j] * kernel[j];
            end
            conv_sum <= conv_sum + bias;
            conv_result[i] <= conv_sum;
        end
    end
end
endmodule

module PE (
    input [7:0] col_data 
);
    
endmodule
