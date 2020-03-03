NAME = ft_ls
FLAGS = 
CC = gcc -g

SRC = 
OBJ = $(addprefix $(OBJDIR), $(SRC:.c=.o))
INC = $(INCDIR)ft_ls.h $(LIBDIR)/includes/libft.h

SRCDIR = src/
OBJDIR = obj/
INCDIR = inc/
LIBDIR = libft/