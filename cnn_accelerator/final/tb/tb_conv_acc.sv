/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

module tb_conv_acc;
    reg                                 i_clk                      ;
    reg                                 i_rstn                     ;

    reg                                 i_start                    ;
    
    wire          [ 7:  0]              o_res                      ;    

top_conv_acc u_top_conv_acc(
    .i_clk                              (i_clk                     ),
    .i_rstn                             (i_rstn                    ),
    .i_start                            (i_start                   ),
    .o_res                              (o_res                     ) 
);

integer fp;

always #5 i_clk = ~i_clk;

initial begin
    i_clk = 0;  i_rstn = 1; i_start = 0; #5  
                i_rstn = 0;              #15 
                i_rstn = 1; i_start = 1; 
end

initial begin
//    i_conv_bias = 15;
//    for (i = 0; i < 28; i++) begin
//        for (j = 0; j < 28; j++) begin
//            i_data[i][j] = j;
//        end
//    end
 
    
//    for (i = 0; i < 9; i++) begin
//        i_conv_weight[i] = i;
//    end

//    fp = $fopen("E:/Vivadoproj/PKUCourse/conv_acc/tb/conv_weight.txt", "r");
//    for (int i = 0; i < 9; i++) begin
//        integer temp;
//        $fscanf(fp, "%d", temp);
//        i_conv_weight[i] = temp;
//    end
    
//    for (int i = 0; i < 676; i++) begin
//        for (int j = 0; j < 10; j++) begin
//            i_fc_weight[i][j] = i + 1;
//        end
//    end

//    fp = $fopen("E:/Vivadoproj/PKUCourse/conv_acc/tb/fc_weight.txt", "r");
//    for (int i = 0; i < 676; i++) begin
//        for (int j = 0; j < 10; j++) begin
//            integer temp;
//            $fscanf(fp, "%d", temp);
//            i_fc_weight[i][j] = temp;
//        end
//    end

//    for (int i = 0; i < 10; i++) begin
//        i_fc_bias[i] = i;
//    end

//    fp = $fopen("E:/Vivadoproj/PKUCourse/conv_acc/tb/fc_bias.txt", "r");
//    for (int i = 0; i < 10; i++) begin
//        integer temp;
//        $fscanf(fp, "%d", temp);
//        i_fc_bias[i] = temp;
//    end

    #10000
    $finish;
end

// dump fsdb
initial begin
    $fsdbDumpfile("conv_acc.fsdb");
    $fsdbDumpvars(0, tb_conv_acc);
    $fsdbDumpMDA();
end

endmodule