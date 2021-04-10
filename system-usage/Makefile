NAME		= wastememory
SRCS		= wastememory.c
OBJS		= $(subst .c,.o,$(SRCS))

all:		$(NAME)

%:			%.c
			@make -f makefile_$@

clean:
			/bin/rm -f $(OBJS)

fclean:		clean
			/bin/rm -rf $(NAME)

re:			fclean all

f:			all clean

.PHONY:		all clean fclean re f
