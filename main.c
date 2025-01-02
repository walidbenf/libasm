#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

// ASM functions
size_t ft_strlen(const char *str);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *str);

void test_ft_strlen() {
    const char *test_str = "Hello, world!";
    const char *empty_str = "";

    printf("Testing ft_strlen:\n");

    size_t len = ft_strlen(test_str);
    printf("ft_strlen(\"%s\") = %zu\n", test_str, len);
    printf("strlen(\"%s\") = %zu\n", test_str, strlen(test_str));

    len = ft_strlen(empty_str);
    printf("ft_strlen(\"\") = %zu\n", len);
    printf("strlen(\"\") = %zu\n", strlen(empty_str));
}

void test_ft_strcpy() {
    char dest[50];
    const char *src = "Hello, world!";
    const char *empty_src = "";

    printf("Testing ft_strcpy:\n");

    ft_strcpy(dest, src);
    printf("ft_strcpy(dest, \"%s\") = \"%s\"\n", src, dest);
    strcpy(dest, src);
    printf("strcpy(dest, \"%s\") = \"%s\"\n", src, dest);

    ft_strcpy(dest, empty_src);
    printf("ft_strcpy(dest, \"\") = \"%s\"\n", dest);
    strcpy(dest, empty_src);
    printf("strcpy(dest, \"\") = \"%s\"\n", dest);
}

void test_ft_strcmp() {
    const char *str1 = "Hello";
    const char *str2 = "Hello";
    const char *str3 = "World";
    const char *empty_str = "";

    printf("Testing ft_strcmp:\n");

    int result = ft_strcmp(str1, str2);
    printf("ft_strcmp(\"%s\", \"%s\") = %d\n", str1, str2, result);
    printf("strcmp(\"%s\", \"%s\") = %d\n", str1, str2, strcmp(str1, str2));

    result = ft_strcmp(str1, str3);
    printf("ft_strcmp(\"%s\", \"%s\") = %d\n", str1, str3, result);
    printf("strcmp(\"%s\", \"%s\") = %d\n", str1, str3, strcmp(str1, str3));

    result = ft_strcmp(str1, empty_str);
    printf("ft_strcmp(\"%s\", \"\") = %d\n", str1, result);
    printf("strcmp(\"%s\", \"\") = %d\n", str1, strcmp(str1, empty_str));
}

void test_ft_write() {
    const char *str = "Hello, world!\n";
    // const char *null_str = NULL;
    ssize_t result;

    printf("Testing ft_write:\n");

    result = ft_write(1, str, 14);
    if (result == -1) {
        perror("ft_write");
    } else {
        write(1, "ft_write succeeded\n", 19);
    }

    // result = ft_write(1, null_str, 14);
    // if (result == -1) {
    //     perror("ft_write with NULL");
    // }

    // result = ft_write(-1, str, 14);
    // if (result == -1) {
    //     perror("ft_write with invalid fd");
    // }
}

void test_ft_read() {
    char buffer[100];
    ssize_t bytes_read;
    int fd = open("testfile.txt", O_RDONLY);
    int invalid_fd = -1;

    printf("Testing ft_read:\n");

    if (fd == -1) {
        perror("open");
        return;
    }

    bytes_read = ft_read(fd, buffer, sizeof(buffer) - 1);
    if (bytes_read == -1) {
        perror("ft_read");
    } else {
        buffer[bytes_read] = '\0';
        printf("ft_read read %zd bytes: %s\n", bytes_read, buffer);
    }

    close(fd);

    bytes_read = ft_read(invalid_fd, buffer, sizeof(buffer) - 1);
    if (bytes_read == -1) {
        perror("ft_read with invalid fd");
    }
}

void test_ft_strdup() {
    const char *str = "Hello, world!";
    const char *null_str = NULL;
    char *dup_str;

    printf("Testing ft_strdup:\n");

    dup_str = ft_strdup(str);
    if (dup_str == NULL) {
        perror("ft_strdup");
    } else {
        printf("ft_strdup(\"%s\") = \"%s\"\n", str, dup_str);
        free(dup_str);
    }

    dup_str = ft_strdup(null_str);
    if (dup_str == NULL) {
        perror("ft_strdup with NULL");
    }
}

int main() {
    test_ft_strlen();
    printf("\n");

    test_ft_strcpy();
    printf("\n");

    test_ft_strcmp();
    printf("\n");

    test_ft_write();
    printf("\n");

    test_ft_read();
    printf("\n");

    test_ft_strdup();
    printf("\n");

    return 0;
}