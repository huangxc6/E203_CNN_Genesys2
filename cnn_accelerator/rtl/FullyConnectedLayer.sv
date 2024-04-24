module FullyConnectedLayer (
    input clk,
    input reset,
    input signed [7:0] weights [675:0][9:0],
    input signed [15:0] input_data [675:0], 
    output reg [31:0] output_data [9:0], 
    output reg fc_done
);
  reg [31:0] accumulator;
  reg [9:0] neuron_counter;
  always @(posedge clk) begin
    if (reset) begin
        accumulator <= 32'd0;
        neuron_counter <= 10'd0;
        fc_done <= 1'b0;
    end else begin
        if (neuron_counter == 10'd0) begin
            accumulator <= 32'd0;
        end
          if (neuron_counter == 10'd10) begin
            output_data <= accumulator[31:0];
            fc_done <= 1'b1;
        end else begin
            accumulator <= accumulator + (input_data * weights[:, neuron_counter]);
            neuron_counter <= neuron_counter + 1;
        end
    end
end

endmodule
