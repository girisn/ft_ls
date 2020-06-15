NAME = ft_ls
CC = gcc
FLAGS =

SRC = add_new_file.c init_flags.c ls_l_flag.c ls_print_basic.c \
	ls_print_table.c ls_print.c main.c sort_check_dots.c sort_list.c
OBJ = $(addprefix $(OBJDIR), $(SRC:.c=.o))
LIBFT = $(LIBDIR)libft.a
INC = $(LIBDIR)includes/libft.h $(INCDIR)ft_ls.h

SRCDIR = src/
OBJDIR = obj/
INCDIR = inc/
LIBDIR = libft/

MKINC = -I $(INCDIR) -I $(LIBDIR)includes/
INCLIB = -L $(LIBDIR) -lft
INCACL = /usr/lib/libacl.a

all: $(NAME)

$(NAME): $(OBJDIR) $(OBJ)
	make -C $(LIBDIR)
	$(CC) $(FLAGS) $(MKINC) $(OBJ) $(INCLIB) $(INCACL) -o $(NAME)

$(OBJDIR)%.o: $(SRCDIR)%.c $(INC)
	$(CC) $(FLAGS) $(MKINC) -c $< -o $@

$(OBJDIR):
	mkdir -p $@

$(LIBFT):
	make -C $(LIBDIR)

clean:
	@make clean -C $(LIBDIR)
	@rm -rf $(OBJDIR)

fclean: clean
	@make fclean -C $(LIBDIR)
	@rm -f $(NAME)

re: fclean all
