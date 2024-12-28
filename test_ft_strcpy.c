#include <stdio.h>

// Déclaration de la fonction ft_strcpy en ASM
char *ft_strcpy(char *dest, const char *src);

int main() {
    char dest[50];
    const char *src = "Hello, world!";
    ft_strcpy(dest, src);
    printf("Copied string: %s\n", dest);
    return 0;
}