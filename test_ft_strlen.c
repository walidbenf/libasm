#include <stdio.h>

// Déclaration de la fonction ft_strlen en ASM
size_t ft_strlen(const char *str);

int main() {
    const char *test_str = "Hello, world!";
    size_t len = ft_strlen(test_str);
    printf("Length of '%s' is %zu\n", test_str, len);
    return 0;
}