NAME = libasm.a
SRC = ft_strlen.s
OBJ = $(SRC:.s=.o)
CC = gcc
NASM = nasm
NASMFLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJ)
	ar	rcs	$@	$^

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME) test_ft_strlen.c
	$(CC) -o test_ft_strlen test_ft_strlen.c $(NAME)
	./test_ft_strlen

clean:
	rm -f $(OBJ) test_ft_strlen

fclean: clean
	rm -f $(NAME)

re: fclean all