CC = gcc
# -I$(INC_DIR) 告诉编译器去 include 文件夹里找头文件
CFLAGS = -Wall -g -I$(INC_DIR)


SRC_DIR = src
INC_DIR = include
OUT_DIR = output

# 找到 src 目录下所有的 .c 文件 (例如: src/main.c src/math_utils.c)
SRCS = $(wildcard $(SRC_DIR)/*.c)
# 将 src/xxx.c 替换为 output/xxx.o (例如: output/main.o output/math_utils.o)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OUT_DIR)/%.o, $(SRCS))

# 最终生成的可执行文件路径
TARGET = $(OUT_DIR)/main

# 默认目标
all: $(TARGET)

# 链接阶段：把所有的 .o 文件拼成最终的 main 可执行文件
$(TARGET): $(OBJS)
	@mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# 编译阶段：把 src/ 下的 .c 编译成 output/ 下的 .o
$(OUT_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:	
	rm -f $(OUT_DIR)/*