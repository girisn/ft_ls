NAME = ft_ls
FLAGS = 
CC = gcc -g

SRC = ft_ls.c
OBJ = $(addprefix $(OBJDIR), $(SRC:.c=.o))
INC = $(INCDIR)ft_ls.h $(LIBINC)libft.h

SRCDIR = src/
OBJDIR = obj/
INCDIR = inc/
LIBDIR = libft/
LIBINC = libft/includes

LIBFT = $(LIBDIR)libft.a
MKINC = -I $(INCDIR) -I $(LIBINC) -L $(LIBDIR)

all: $(OBJDIR) $(LIBFT) $(NAME)

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(MKINC) $^ -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)%.o: $(SRCDIR)%.c $(INC)
	$(CC) $(FLAGS) -o $@ -c $^ 

$(LIBFT):
	make -C $(LIBDIR)

clean:
	make -C clean $(LIBDIR)
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)
	make -C fclean $(LIBDIR)

re: fclean all
