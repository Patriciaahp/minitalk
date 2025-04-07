NAME=
AR=ar rcs
CFLAGS=-Wall -Werror -Wextra
RM=rm -f

FILES =

OBJS=$(FILES:.c=.o)
BONUS_OBJS=$(BONUS_FILES:.c=.o)

all: $(NAME)

$(NAME): $(OBJS) $(BONUS_OBJS)
	$(AR) $@ $?

%.o: %.c
	cc -c $(CFLAGS) $?

clean:
	$(RM) $(OBJS) $(BONUS_OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

bonus: $(OBJS) $(BONUS_OBJS)
	$(AR) $(NAME) $(OBJS)

.PHONY: all clean fclean re bonus