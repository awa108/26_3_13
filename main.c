#include <stdio.h>
#include"math_utils.c"
int main()
{
    int n;
    scanf("%d", &n);
    int result = factorial(n);
    if(result == -1){
        printf("Error: Factorial is not defined for negative numbers.\n");
    } else {
        printf("Factorial of %d is %d\n", n, result);
    }
    return 0;
}//尝试
