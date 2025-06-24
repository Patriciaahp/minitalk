
NAME_CLIENT = client
NAME_SERVER = server

SRCS_CLIENT = client.c
SRCS_SERVER = server.c

LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror

all: $(LIBFT) $(NAME_CLIENT) $(NAME_SERVER)

$(LIBFT):
	make -C $(LIBFT_DIR)

$(NAME_CLIENT): $(SRCS_CLIENT) $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SRCS_CLIENT) -L$(LIBFT_DIR) -lft

$(NAME_SERVER): $(SRCS_SERVER) $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SRCS_SERVER) -L$(LIBFT_DIR) -lft

clean:
	make clean -C $(LIBFT_DIR)

fclean: clean
	make fclean -C $(LIBFT_DIR)
	rm -f $(NAME_CLIENT) $(NAME_SERVER)

re: fclean all

.PHONY: all clean fclean re