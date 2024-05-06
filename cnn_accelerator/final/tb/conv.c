/******************************************************************************
*
*  Authors:   Chengyi Zhang
*     Date:   2023/4/20
*   Method:   
*  Version:   
*  Content:  
* 
******************************************************************************/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define IMG_SIZE 28
#define CONV_KERNEL_SIZE 3
#define CONV_STRIDE 1
#define CONV_OUTPUT_SIZE (IMG_SIZE - CONV_KERNEL_SIZE + 1) * (IMG_SIZE - CONV_KERNEL_SIZE + 1)
#define FC_INPUT_SIZE (IMG_SIZE - CONV_KERNEL_SIZE + 1) * (IMG_SIZE - CONV_KERNEL_SIZE + 1)
#define FC_OUTPUT_SIZE 10
#define FC_BIAS_SIZE 10

// 输入图像
uint8_t input[IMG_SIZE][IMG_SIZE];

// 卷积层权重
uint8_t conv_weights[CONV_KERNEL_SIZE][CONV_KERNEL_SIZE];

// 卷积层偏置
int8_t conv_bias = 15;

// 全连接层权重
int8_t fc_weights[FC_INPUT_SIZE][FC_OUTPUT_SIZE];

int8_t fc_bias [FC_BIAS_SIZE];

void conv_layer(uint8_t input[IMG_SIZE][IMG_SIZE], int output[CONV_OUTPUT_SIZE]) {
    int idx = 0;
    // for (int i = 25; i < 28; i++) {
    //     for (int j = 25; j < 28; j++) {
    //         printf("input[%d][%d]:%d\n", i, j, input[i][j]);
    //     }
    // }
    for (int i = 0; i < IMG_SIZE - CONV_KERNEL_SIZE + 1; i++) {
        for (int j = 0; j < IMG_SIZE - CONV_KERNEL_SIZE + 1; j++) {
            int sum = conv_bias;
            for (int k = 0; k < CONV_KERNEL_SIZE; k++) {
                for (int l = 0; l < CONV_KERNEL_SIZE; l++) {
                    sum += (uint8_t) (input[i + k][j + l] * conv_weights[k][l]);
                    printf("input[%d][%d](%d) * conv_weights[%d][%d](%d)\n", i+k, j+l, input[i+k][j+l], k, l, conv_weights[k][l]);
                }
            }
            output[idx++] = sum;
            printf("Conv output[%d]: %d\n", idx-1, output[idx-1]);
        }
    }
}

void fc_layer(int input[FC_INPUT_SIZE], int output[FC_OUTPUT_SIZE]) {
    // for (int i = 650; i < 676; i++) {
    //     for (int j = 0; j < 10; j++) {
    //         printf("input[%d]:%d  ", i, input[i]);
    //         printf("fc_weight[%d][%d]:%d\n", i, j, fc_weights[i][j]);
    //     }
    // }
    for (int i = 0; i < FC_OUTPUT_SIZE; i++) {
        //int sum = fc_bias[i];
        int sum = 0;
        for (int j = 0; j < FC_INPUT_SIZE; j++) {
            sum +=  input[j] * fc_weights[j][i];
           
            if ((j + 1) % 26 == 0) {
                // printf("input[%d]:%d   ", j, input[j]);
                printf("FC output[%d]: %d\n", i, sum);
            }
        }
        output[i] = sum;
    }
}

int main() {
    // 设置输入图像
    // for (int i = 0; i < 28; i++) {
    //     for (int j = 0; j < 28; j++) {
    //         input[i][j] = j;
    //     }
    // }
    FILE* fp = fopen("image.txt", "r");
    for (int i = 0; i < 28; i++) {
        for (int j = 0; j < 28; j++) {
            fscanf(fp, "%hhd", &input[i][j]);
        }
    }

    // for (int i = 0; i < 28; i++) {
    //     for (int j = 0; j < 28; j++) {
    //         if (i*28+j == 202)
    //             printf("input[%d][%d]:%d\n", i, j, input[i][j]);
    //     }
    // }

    // 设置卷积层权重
    // for (int i = 0; i < 3; i++) {
    //     for (int j = 0; j < 3; j++) {
    //         conv_weights[i][j] = 3*i + j;
    //     }
    // }

    fp = fopen("conv_weight.txt", "r");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            fscanf(fp, "%hhd", &conv_weights[i][j]);
        }
    }

    // for (int i = 0; i < 3; i++) {
    //     for (int j = 0; j < 3; j++) {
    //         printf("conv_weight[%d][%d]:%d\n", i, j, conv_weights[i][j]);
    //     }
    // }

    // 设置全连接层权重
    // for (int i = 0; i < 676; i++) {
    //     for (int j = 0; j < 10; j++) {
    //         fc_weights[i][j] = i + 1;
    //     }
    // }

    fp = fopen("fc_weight.txt", "r");
    for (int i = 0; i < 676; i++) {
        for (int j = 0; j < 10; j++) {
            fscanf(fp, "%hhd", &fc_weights[i][j]);
        }
    }

    // for (int i = 0; i < 676; i++) {
    //     for (int j = 0; j < 10; j++) {
    //         printf("fc_weight[%d][%d]:%d\n", i, j, fc_weights[i][j]);
    //     }
    // }

    // 设置全连接层偏置
    // for (int i = 0; i < 10; i++) {
    //     fc_bias[i] = i;
    // }
    fp = fopen("fc_bias.txt", "r");
    for (int i = 0; i < 10; i++) {
        fscanf(fp, "%hhd", &fc_bias[i]);
    }


    int conv_output[CONV_OUTPUT_SIZE];
    int fc_output[FC_OUTPUT_SIZE];

    // 卷积层
    conv_layer(input, conv_output);

    // 全连接层
    fc_layer(conv_output, fc_output);

    // 输出结果
    for (int i = 0; i < FC_OUTPUT_SIZE; i++) {
        printf("Output %d: %d\n", i, fc_output[i]);
    }

    return 0;
}