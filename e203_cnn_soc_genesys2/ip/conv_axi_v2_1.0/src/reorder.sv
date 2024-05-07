module reorder (
    input                               i_clk                         ,
    input                               i_rstn                        ,
    input              [  31: 0]        i_data           [9: 0]       ,
    input                               i_pre_valid                   ,
    output reg         [   7: 0]        o_max_index                   
);

integer i;

reg [31:0] max_value_0_1;
reg [31:0] max_value_2_3;
reg [31:0] max_value_4_5;
reg [31:0] max_value_6_7;

reg [ 7:0] max_index_0_1;
reg [ 7:0] max_index_2_3;
reg [ 7:0] max_index_4_5;
reg [ 7:0] max_index_6_7;

assign max_value_0_1 = ($signed(i_data[0]) > $signed(i_data[1])) ? i_data[0] : i_data[1];
assign max_value_2_3 = ($signed(i_data[2]) > $signed(i_data[3])) ? i_data[2] : i_data[3];
assign max_value_4_5 = ($signed(i_data[4]) > $signed(i_data[5])) ? i_data[4] : i_data[5];
assign max_value_6_7 = ($signed(i_data[6]) > $signed(i_data[7])) ? i_data[6] : i_data[7];

assign max_index_0_1 = ($signed(i_data[0]) > $signed(i_data[1])) ? 8'b0000_0001 : 8'b0000_0010;
assign max_index_2_3 = ($signed(i_data[2]) > $signed(i_data[3])) ? 8'b0000_0100 : 8'b0000_1000;
assign max_index_4_5 = ($signed(i_data[4]) > $signed(i_data[5])) ? 8'b0001_0000 : 8'b0010_0000;
assign max_index_6_7 = ($signed(i_data[6]) > $signed(i_data[7])) ? 8'b0100_0000 : 8'b1000_0000;

reg [31:0] max_value_0_1_2_3;
reg [31:0] max_value_4_5_6_7;

reg [ 7:0] max_index_0_1_2_3;
reg [ 7:0] max_index_4_5_6_7;

assign max_value_0_1_2_3 = ($signed(max_value_0_1) > $signed(max_value_2_3)) ? max_value_0_1 : max_value_2_3;
assign max_value_4_5_6_7 = ($signed(max_value_0_1) > $signed(max_value_2_3)) ? max_value_4_5 : max_value_6_7;

assign max_index_0_1_2_3 = ($signed(max_value_0_1) > $signed(max_value_2_3)) ? max_index_0_1 : max_index_2_3;
assign max_index_4_5_6_7 = ($signed(max_value_0_1) > $signed(max_value_2_3)) ? max_index_4_5 : max_index_6_7;

always @(posedge i_clk) begin
    if (!i_rstn) begin
        o_max_index <= 0;
    end else if (i_pre_valid) begin
        o_max_index <= ($signed(max_value_0_1_2_3) > $signed(max_value_4_5_6_7)) ? max_index_0_1_2_3 : max_index_4_5_6_7;
    end
end

endmodule