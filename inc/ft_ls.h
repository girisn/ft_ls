#ifndef FT_LS_H
#define FT_LS_H

# include "libft.h"

# include <unistd.h>
# include <fcntl.h>
# include <dirent.h>
# include <sys/stat.h>
# include <pwd.h>
# include <sys/types.h>
# include <grp.h>
# include <sys/xattr.h>
# include <time.h>
# include <stdlib.h>
# include <stdio.h>
# include <string.h>
# include <sys/ioctl.h>


# define F_A	1
# define F_L	2
# define F_BR	4
# define F_R	8
# define F_T	16
# define F_ONE	32

typedef struct stat t_stat;

typedef struct		s_ls
{
	char			*name;
	char			*path;
	t_stat			*stat;
	struct s_ls		*next;
}					t_ls;

int		ls_error(char *str, int n);

t_ls	*sort_list(t_ls *ls, int flag);

int		add_new_file(char *path, char *name, t_ls **file);

int		set_options(char *str, int *flags);
int		set_flags(int argc, char **argv, int *flags);


int		ft_strcmp_abc(char *s1, char *s2);

#endif