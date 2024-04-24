module top(
    input   clk         ,
    input   reset       ,

    //input port
    input   vld_i       ,
    //output  rdy_o     ,
    input signed [7:0] image_in [27:0][27:0]        ,
    input signed [7:0] fc_weights_in [675:0][9:0]   ,
    input signed [7:0] conv_kernel_in [0:3*3-1]        ,

    // output port
    output  done        ,
    output  [31:0] output_data [9:0]
);

// 信号定义
reg signed [7:0] image_reg [27:0][27:0];
reg signed [7:0] conv_kernel_reg [0:3*3-1];
reg [7:0] bias;
reg signed [15:0] conv_in_data [0:9*26*26-1];
reg [15:0] conv_out_data [0:26*26-1];
reg [7:0] fc_weights_reg [675:0][9:0];
reg [15:0] fc_in_data [675:0];
reg [31:0] fc_out_data [9:0];
reg fc_done;
reg vld_i_reg;
// 实例化模块
Im2Col im2col_inst (
    .clk(clk),
    .reset(reset)
    .vld_i(vld_i_reg)
    .vld_o(im2col_vld_o)
    .image(image_reg),
    .col_data(conv_in_data),

);

ConvolutionAccelerator conv_acc_inst (
    .col_data(conv_in_data),
    .kernel(kernel),
    .bias(bias),
    .conv_result(conv_out_data),
    .clk(clk),
    .reset(reset)
);

FullyConnectedLayer fc_layer_inst (
    .clk(clk),
    .reset(reset),
    .weights(weights),
    .input_data(fc_in_data),
    .output_data(output_data),
    .fc_done(done)
);

// input store
integer i, j;
always @(posedge clk) begin
    if(reset) begin
        for (i = 0 ; i <= 27 ; i = i + 1 ) begin
            for (j = 0 ; j <= 27 ; j = j + 1 ) begin
                image_reg[i][j] <= 8'b0;
            end
        end 
    end else if(vld_i) begin
        for (i = 0 ; i <= 27 ; i = i + 1 ) begin
            for (j = 0 ; j <= 27 ; j = j + 1 ) begin
                image_reg[i][j] <= image_in[i][j];
            end
        end         
    end
end

always @(posedge clk) begin
    if(reset) begin
        for (i = 0 ; i <= 675 ; i = i + 1 ) begin
            for (j = 0 ; j <= 9 ; j = j + 1 ) begin
                fc_weights_reg[i][j] <= 8'b0;
            end
        end 
    end else if(vld_i) begin
        for (i = 0 ; i <= 675 ; i = i + 1 ) begin
            for (j = 0 ; j <= 9 ; j = j + 1 ) begin
                fc_weights_reg[i][j] <= fc_weights_in[i][j];
            end
        end         
    end
end

always @(posedge clk) begin
    if(reset) begin
        for (i = 0 ; i <= 3*3-1 ; i = i + 1 ) begin
            conv_kernel_reg[i][j] <= 8'b0;
        end 
    end else if(vld_i) begin
        for (i = 0 ; i <= 3*3-1 ; i = i + 1 ) begin
            conv_kernel_reg[i][j] <= conv_kernel_in[i][j];
            end
        end         
    end
end

// vld_i_reg
always @(posedge clk) begin
    if(reset)
        vld_i_reg <= 1'b0;
    else
        vld_i_reg <= vld_i;
end
// 连接卷积层输出到全连接层输入
always @(posedge clk) begin
    if (reset) begin
        fc_in_data <= 0;
    end else if (conv_done) begin // 假设有一个信号表示卷积层计算完成
        for (int i = 0; i < 675; i = i + 1) begin
            fc_in_data[i] <= conv_out_data[i];
        end
    end
end

// 其他控制逻辑和信号处理...

endmodule