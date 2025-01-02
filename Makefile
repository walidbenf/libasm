NAME = libasm.a
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJ = $(SRC:.s=.o)
CC = gcc -Wall -Wextra -Werror
NASM = nasm
NASMFLAGS = -f elf64

all: $(NAME) libasm

$(NAME): $(OBJ)
	ar rcs $@ $^

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

libasm: $(NAME) main.c
	$(CC) -o libasm main.c $(NAME)

test: libasm
	./libasm

clean:
	rm -f $(OBJ) libasm

fclean: clean
	rm -f $(NAME)

re: fclean all