/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module im2col (
    input                               i_clk                      ,
    input                               i_rstn                      ,

    input                               i_pre_valid                ,    // TODO: handshake
    output                              o_pre_ready                ,
    
    output  logic                       o_post_valid               ,
    input                               i_post_ready               ,

    input                [   7: 0]      i_data [  2: 0]  [ 27: 0]  ,
    output               [   4: 0]      o_addr                     ,
    output               [   7: 0]      o_data [ 25: 0]  [  8: 0]  
);

logic [   7: 0]     kernel  [  25:  0]  [    8:  0]                ;
logic [   4: 0]     cnt                                            ;

// 1. shake hands to reg pre/post stage signals://///////////////////////////////////////////////////////////

// i_pre_valid --> ⌈‾‾‾‾⌉ --> o_post_valid
//                 |REG|
// o_pre_ready <-- ⌊____⌋ <-- i_post_ready

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
    .dout                               (o_post_valid              ) 
);

//2. counter: 2.1 count the im2col process. If fully covering the image, img_buffer 
//                send ready to pre stage 
//            2.2 serve as index of input image in img_buffer 


always @ (posedge i_clk) begin
    if (!i_rstn) begin
        cnt <= 0;
    end else if (cnt == 26) begin
        cnt <= 0;
    end else if (post_fire) begin
        cnt <= cnt + 1;
    end
end

assign o_addr = cnt;

//3. im2col process -- n: kernel id; i: kernel row; j: kernel col ///////////////////////////////////////////

generate
    for (genvar n = 0; n < 26; n++) begin
        for (genvar i = 0; i < 3; i++) begin
            for (genvar j = 0; j <3; j++) begin
                lib_reg#(
                    .WIDTH(8),
                    .RESET_VAL(8'b0)
                ) u_row(
                    .clk                                (i_clk                     ),
                    .rst                                (i_rstn                    ),
                    .din                                (i_data[i][j+n]            ),
                    .dout                               (kernel[n][3*i+j]          ),
                    .wen                                (pre_fire                  ) 
                );
            end
        end
    end
endgenerate

generate 
    for (genvar i = 0; i < 26; i++) begin
        for (genvar j = 0; j < 9; j++) begin
            assign o_data[i][j] = kernel[i][j];
        end
    end
endgenerate



// generate
//     for (genvar i = 0; i < 3; i++) begin
//         for (genvar j = 0; j < 3; j++) begin
//             lib_reg#(
//                 .WIDTH(8),
//                 .RESET_VAL(8'b0)
//             ) u_row_0(
//                 .clk                                (i_clk                     ),
//                 .rst                                (i_rst                     ),
//                 .din                                (i_data[i][j]              ),
//                 .dout                               (kernel[0][3*i+j]          ),
//                 .wen                                (i_wen                     ) 
//             );
//         end
//     end
// endgenerate

// generate
//     for (genvar i = 0; i < 3; i++) begin
//         for (genvar j = 0; j < 3; j++) begin
//             lib_reg#(
//                 .WIDTH(8),
//                 .RESET_VAL(8'b0)
//             ) u_row_1(
//                 .clk                                (i_clk                     ),
//                 .rst                                (i_rst                     ),
//                 .din                                (i_data[i][j+1]            ),
//                 .dout                               (kernel[1][3*i+j]          ),
//                 .wen                                (i_wen                     ) 
//             );
//         end
//     end
// endgenerate

// generate
//     for (genvar i = 0; i < 3; i++) begin
//         for (genvar j = 0; j < 3; j++) begin
//             lib_reg#(
//                 .WIDTH(8),
//                 .RESET_VAL(8'b0)
//             ) u_row_2(
//                 .clk                                (i_clk                     ),
//                 .rst                                (i_rst                     ),
//                 .din                                (i_data[i][j+2]            ),
//                 .dout                               (kernel[2][3*i+j]          ),
//                 .wen                                (i_wen                     ) 
//             );
//         end
//     end
// endgenerate

endmodule