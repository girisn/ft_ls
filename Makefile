NAME = ft_ls
CC = gcc
FLAGS =

SRC = main.c init_flags.c sort_list.c add_new_file.c
OBJ = $(addprefix $(OBJDIR), $(SRC:.c=.o))
LIBFT = $(LIBDIR)libft.a
INC = $(LIBDIR)includes/libft.h $(INCDIR)ft_ls.h

SRCDIR = src/
OBJDIR = obj/
INCDIR = inc/
LIBDIR = libft/

MKINC = -I $(INCDIR) -I $(LIBDIR)includes/
INCLIB = -L $(LIBDIR) -lft

all: $(NAME)

$(NAME): $(OBJDIR) $(OBJ)
	make -C $(LIBDIR)
	$(CC) $(FLAGS) $(MKINC) $(OBJ) $(INCLIB) -o $(NAME)

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
