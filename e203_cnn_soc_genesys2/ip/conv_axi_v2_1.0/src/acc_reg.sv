/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module acc_reg (
    input                               i_clk                      ,
    input                               i_rstn                     ,
    
    input                               i_pre_valid                ,
    output                              o_pre_ready                ,
    output                              o_post_valid               ,
    input                               i_post_ready               ,

    input               [   31: 0]      i_res          [    9: 0]  ,
    input               [    7: 0]      i_bias         [    9: 0]  ,
    output              [   31: 0]      o_res          [    9: 0]  
);

wire pre_fire = i_pre_valid & o_pre_ready;
wire post_fire = o_post_valid & i_post_ready;

logic              pre_valid_r      ;

assign o_pre_ready =  pre_valid_r  & i_post_ready | !pre_valid_r ;

lib_reg #(
    .WIDTH                              (1                         ),
    .RESET_VAL                          (0                         ) 
  ) postvalid (
    .clk                                (i_clk                     ),
    .rst                                (i_rstn                    ),
    .wen                                (o_pre_ready               ),
    .din                                (i_pre_valid               ),
    .dout                               (pre_valid_r               ) 
);

logic  [   31: 0]  acc_r   [   9: 0];
logic  [   31: 0]  add_res [   9: 0];
logic  [    4: 0]  cnt              ;
logic  [   31: 0]  bias_extend[9: 0];

generate
    for (genvar i = 0; i < 10; i++) begin
        assign add_res[i] = acc_r[i] + i_res[i];
        assign bias_extend[i] = {{24{i_bias[i][7]}}, i_bias[i]};
    end
endgenerate



always @ (posedge i_clk) begin
    if (!i_rstn) begin
        cnt <= 0;
    end else if (post_fire) begin
        cnt <= 0;
    end else if (pre_fire) begin
        cnt <= cnt + 1;       
    end
end

wire done = cnt == 26;

assign o_post_valid = pre_valid_r & done;


generate
    for (genvar i = 0; i < 10; i++) begin
        always @ (posedge i_clk) begin
            if (!i_rstn) begin
                acc_r[i] <= 0;
            end else if (post_fire) begin
                if (pre_fire)
                    acc_r[i] <= i_res[i];
                else
                    acc_r[i] <= 0;
            end else if (pre_fire) begin
                if (cnt == 0)
                    acc_r[i] <= add_res[i] + bias_extend[i];
                else 
                    acc_r[i] <= add_res[i];
            end
        end
        assign o_res[i] = acc_r[i];
    end
endgenerate


endmodule