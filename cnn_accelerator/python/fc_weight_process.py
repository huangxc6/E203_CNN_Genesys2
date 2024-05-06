# 打开数据文件并读取所有数据到一个字符串
with open('fc_weights.txt', 'r') as file:
    data_string = file.read().strip()

# 使用空格分割字符串，将数据转换为列表
data = data_string.split()

# 检查数据长度是否符合预期（784个数据）
if len(data) != 6760:
    raise ValueError("Data does not contain 6760 elements.")

# 初始化输出列表
output_lines = []

# 因为数据是784个数据，所以m和n的范围应该是0到27，共28行和列
for m in range(676):
    for n in range(10):
        # 计算当前索引
        index = 10 * m + n
        # 格式化输出行
        output_line = f"assign rom[{m}][{n}] = {data[index]};\n"
        # 将格式化后的行添加到输出列表中
        output_lines.append(output_line)

# 将输出列表合并为一个字符串，并写入到txt文件
with open('fc_weight_2_rom.txt', 'w') as file:
    file.writelines(output_lines)

print("Output file 'output.txt' has been created without trailing commas.")