NAME		= libasm.a

LIBFT 		= $(LIBFT_DIR)/libasm.a

SRC_DIR		= ./src/
SRC			=	$(SRC_DIR)ft_write.s

OBJ_DIR		= ./obj/
OBJ			= $(SRC:.s=.o)

NASM		= nasm
NASMFLAGS	= -f elf64

GCC			= gcc
CFLAGS		= -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(SRC)
	@ $(NASM) $(NASMFLAGS) $(SRC)
	@ mkdir $(OBJ_DIR)
	@ ar -rc $(NAME) $(OBJ)
	@ mv $(OBJ) $(OBJ_DIR)
	@ echo "$(NAME) created successfully!"

main: all
	@ $(GCC) $(CFLAGS) -o main_test ./src/main.c $(NAME)
	@ mkdir ./bin/
	@ mv ./main_test ./bin/
	@ echo "Tests compiled successfully!"

clean:
	@ rm -f $(OBJ_DIR)*.o
	@ rm -rf $(OBJ_DIR)
	@ echo "libasm object files erased successfully!"

fclean: clean
	@ rm -f $(NAME)
	@ rm -rf ./bin/
	@ echo "$(NAME) library erased successfully!"

re: fclean all

.PHONY: all clean fclean re
