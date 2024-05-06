# 打开数据文件并读取内容，去除每行末尾的逗号
# with open('image.txt', 'r') as file:
with open('image.txt', 'r') as file:
    data_lines = file.readlines()

# 移除每行末尾的逗号（如果存在）
data = [line.strip().rstrip(',') for line in data_lines]

# 初始化输出列表
output_lines = []

# 因为数据是784个数据，所以m和n的范围应该是0到27，共28行和列
for m in range(28):
    for n in range(28):
        # 计算当前索引
        index = 28 * m + n
        # 格式化输出行
        output_line = f"assign rom[{m}][{n}] = {data[index]};\n"
        # 将格式化后的行添加到输出列表中
        output_lines.append(output_line)

# 将输出列表合并为一个字符串，并写入到txt文件
with open('output.txt', 'w') as file:
    file.writelines(output_lines)

print("Output file 'output.txt' has been created without trailing commas.")