NAME = libasm.a
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s
OBJ = $(SRC:.s=.o)
CC = gcc
NASM = nasm
NASMFLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $@ $^

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME) test_ft_strlen.c test_ft_strcpy.c test_ft_strcmp.c
	$(CC) -o test_ft_strlen test_ft_strlen.c $(NAME)
	$(CC) -o test_ft_strcpy test_ft_strcpy.c $(NAME)
	$(CC) -o test_ft_strcmp test_ft_strcmp.c $(NAME)
	./test_ft_strlen
	./test_ft_strcpy
	./test_ft_strcmp

clean:
	rm -f $(OBJ) test_ft_strlen test_ft_strcpy test_ft_strcmp

fclean: clean
	rm -f $(NAME)

re: fclean all