#include <stdio.h>

// Déclarations des fonctions en ASM
size_t ft_strlen(const char *str);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);

void test_ft_strlen() {
    const char *test_str = "Hello, world!";
    size_t len = ft_strlen(test_str);
    printf("ft_strlen(\"%s\") = %zu\n", test_str, len);
}

void test_ft_strcpy() {
    char dest[50];
    const char *src = "Hello, world!";
    ft_strcpy(dest, src);
    printf("ft_strcpy(dest, \"%s\") = \"%s\"\n", src, dest);
}

void test_ft_strcmp() {
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
}

int main() {
    printf("Testing ft_strlen:\n");
    test_ft_strlen();
    printf("\n");

    printf("Testing ft_strcpy:\n");
    test_ft_strcpy();
    printf("\n");

    printf("Testing ft_strcmp:\n");
    test_ft_strcmp();
    printf("\n");

    return 0;
}