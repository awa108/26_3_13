# 1. 声明要求的最低版本（保证语法兼容性）
cmake_minimum_required(VERSION 3.10)

# 2. 定义项目名称和版本
project(ISP_Lab2 VERSION 1.0)

# 3. 指定编译选项（这里开启了所有警告并使用 C11 标准）
set(CMAKE_C_STANDARD 11)
add_compile_options(-Wall -Wextra -g)
# 指定源码路径
add_executable(hello src/main.c src/math_utils.c)
# 4. 告诉 CMake：我要生成一个叫 hello 的程序，源码是这些
# 添加头文件搜索路径（意思是对目标“hello”添加头文件目录 include/）
# 编译这个目标时会在 include 目录中查找头文件
# PUBLIC： 指对当前 target + 依赖它的 target
target_include_directories(hello PUBLIC include)

