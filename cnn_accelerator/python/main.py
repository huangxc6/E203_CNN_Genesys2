import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.datasets import mnist
import numpy as np



# 加载并准备数据集
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
train_images = train_images.reshape((-1, 28, 28, 1)).astype('float32') / 255.0
test_images = test_images.reshape((-1, 28, 28, 1)).astype('float32') / 255.0
# 使用数据增强技术
datagen = tf.keras.preprocessing.image.ImageDataGenerator(
    rotation_range=10,
    width_shift_range=0.1,
    height_shift_range=0.1,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    fill_mode='nearest'
)

datagen.fit(train_images)

# 构建神经网络模型
model = models.Sequential([
    layers.Conv2D(1, (3, 3), activation='relu',input_shape=(28, 28, 1)),
    layers.Flatten(),
    layers.Dense(10, activation='softmax'),
])

# 尝试不同的优化器和学习率
optimizer = tf.keras.optimizers.Adam(learning_rate=0.001)
model.compile(optimizer=optimizer, loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# 尝试不同的正则化技术
model.add(layers.Dropout(0.2))


# 训练模型
model.fit(train_images, train_labels, epochs=5, batch_size=128, validation_split=0.1)

import numpy as np

# 定义保存函数
def save_weights_to_txt(weights, file_path):
    with open(file_path, 'w') as f:
        for layer_weights in weights:
            for i, w in enumerate(layer_weights):
                if len(w.shape) == 4:  # 如果是卷积层的权重
                    for j in range(w.shape[-1]):
                        np.savetxt(f, w[:, :, :, j].flatten().reshape(1, -1), fmt='%d', header=f'conv_{i}_filter_{j}')
                elif len(w.shape) == 2:  # 如果是全连接层的权重
                    np.savetxt(f, w.flatten().reshape(1, -1), fmt='%d', header=f'fc_{i}_weights')
                elif len(w.shape) == 1:  # 如果是全连接层的偏置
                    np.savetxt(f, w.reshape(1, -1), fmt='%d', header=f'fc_{i}_bias')
            f.write('\n')
            
# 定义一个不同的量化函数
def my_quantization(weights, scale_factor=100, symmetric=True):
    quantized_weights = []
    for w in weights:
        if symmetric:
            max_val = np.max(np.abs(w))
            quantized_w = np.round(w * scale_factor / max_val)
        else:
            quantized_w = np.round(w * scale_factor / np.max(np.abs(w)))
        quantized_weights.append(quantized_w)
    return quantized_weights


# 定义一个针对权重的量化函数
def quantize_weights(weights, scale_factor=100):
    quantized_weights = []
    for w in weights:
        max_val = np.max(np.abs(w))
        quantized_w = np.round(w * scale_factor / max_val)
        quantized_weights.append(quantized_w)
    return quantized_weights


def quantize_activation(weights, scale_factor=100):
    quantized_weights = []
    for w in weights:
        quantized_w = np.round(w * scale_factor)
        quantized_weights.append(quantized_w)
    return quantized_weights

# 量化模型参数
quantized_weights = []
for layer in model.layers:
    if isinstance(layer, layers.Conv2D):
        weights = layer.get_weights()
        quantized_weights.append(quantize_activation(weights))
    elif isinstance(layer, layers.Dense):
        weights = layer.get_weights()
        quantized_weights.append(quantize_activation(weights))
    else:
        quantized_weights.append(layer.get_weights())


        
# 使用量化后的参数重新设置模型权重
for layer, q_weights in zip(model.layers, quantized_weights):
    layer.set_weights(q_weights)

# 评估模型性能
loss, accuracy = model.evaluate(test_images, test_labels)
print("Test Accuracy:", accuracy)

# 保存量化后的权重到文本文件
save_weights_to_txt(quantized_weights, 'quantized_weights.txt')


# 使用量化后的参数重新设置模型权重
for layer, q_weights in zip(model.layers, quantized_weights):
    layer.set_weights(q_weights)

# 打印量化后的模型参数
for layer in model.layers:
    print(layer.get_weights())

