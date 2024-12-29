#include <stdio.h>

// Déclaration de la fonction ft_strcmp en ASM
int ft_strcmp(const char *s1, const char *s2);

int main() {
    const char *str1 = "Hello";
    const char *str2 = "Hello";
    const char *str3 = "World";
    int result;

    result = ft_strcmp(str1, str2);
    printf("ft_strcmp(\"%s\", \"%s\") = %d\n", str1, str2, result);

    result = ft_strcmp(str1, str3);
    printf("ft_strcmp(\"%s\", \"%s\") = %d\n", str1, str3, result);

    result = ft_strcmp(str3, str1);
    printf("ft_strcmp(\"%s\", \"%s\") = %d\n", str3, str1, result);

    return 0;
}