module Im2Col (
    input [7:0] image [27:0][27:0], 
    output reg [7:0] col_data [0:8*26*26-1],      
    input clk,
    input reset
);
    reg [7:0] image_block [2:0][2:0]; 
    integer i, j, k, l, m, n;
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 3; i = i + 1) begin
                for (j = 0; j < 3; j = j + 1) begin
                    image_block[i][j] <= 0;
                end
            end
            for (i = 0; i < 26*26; i = i + 1) begin
                for (j = 0; j < 3*3; j = j + 1) begin
                    col_data[i][j] <= 0;
                end
            end
        end 
        else begin
            for (k = 0; k < 26; k = k + 1) begin
                for (l = 0; l < 26; l = l + 1) begin
                    for (m = 0; m < 3; m = m + 1) begin
                        for (n = 0; n < 3; n = n + 1) begin
                            image_block[m][n] <= image[k + m][l + n];
                        end
                    end
                    for (m = 0; m < 3; m = m + 1) begin
                        for (n = 0; n < 3; n = n + 1) begin
                            col_data[(k*26 + l)*9 + m*3 + n] <= image_block[m][n];
                        end
                    end
                end
            end
        end
    end
endmodule
