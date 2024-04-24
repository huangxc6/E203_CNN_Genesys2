import numpy as np


with open('image.txt', 'r') as f:
    data = f.read().rstrip(',').split(',\n')

image_data = np.array(data, dtype=np.uint8)

image = image_data.reshape((28, 28))

kernel = np.array([[38, 124, 104],
                   [43, 58, 34],
                   [67, 92, 125]], dtype=np.uint8)

bias = 15

def img2col(image, kernel_size):
    rows, cols = image.shape
    krows, kcols = kernel_size
    out_rows = rows - krows + 1
    out_cols = cols - kcols + 1
    result = np.zeros((out_rows * out_cols, krows * kcols), dtype=np.uint8)
    for i in range(out_rows):
        for j in range(out_cols):
            patch = image[i:i+krows, j:j+kcols].flatten()
            result[i*out_cols + j, :] = patch
    return result.reshape((out_rows * out_cols, krows * kcols, 1))


preprocessed_image = img2col(image, (3, 3))


intermediate_results = []


for i in range(preprocessed_image.shape[0]):
    conv_result = np.sum(preprocessed_image[i].reshape(3, 3) * kernel) + bias
    intermediate_results.append(conv_result)


for i, result in enumerate(intermediate_results):
    print(f"Convolution Step {i+1} Result:", result)

max_value_index = np.argmax(intermediate_results)
max_value = intermediate_results[max_value_index]
print("最大值是:", max_value, "，出现在计算步骤:", max_value_index + 1)

with open('fc_weights.txt', 'r') as f:
    fc_weights_data = f.readlines()


def load_weights_from_txt(file_path):
    weights = []
    with open(file_path, 'r') as f:
        layer_weights = [] 
        for line in f:
            if line.startswith('# fc'): 
                if "weights" in line or "bias" in line: 
                    weight_values = np.loadtxt([next(f)], dtype=int)  
                    layer_weights.append(weight_values)
        if layer_weights: 
            weights.append(layer_weights)
    return weights

file_path = 'quantized_weights.txt'  
loaded_weights = load_weights_from_txt(file_path)
print(loaded_weights)

fc_weights = np.array(loaded_weights[0][0]).reshape(676, 10)  
fc_bias = loaded_weights[0][1]  
fc_result = np.dot(np.array(intermediate_results).reshape(1, -1), fc_weights) + fc_bias
print(fc_result)



print("Fully Connected Layer Result:", fc_result)

max_value = np.max(fc_result)


print("最大值是:", max_value)
