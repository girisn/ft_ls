#ifndef FT_LS_H
# define FT_LS_H

# include <unistd.h>
# include <fcntl.h>
# include <stdlib.h>
# include <stdio.h>
# include <dirent.h>
# include <sys/stat.h>
# include <sys/types.h>
# include <pwd.h>
# include <grp.h>
# include <sys/xattr.h>
# include <time.h>
# include <string.h>
# include "libft.h"

# define F_FILE 1
# define F_BR	2
# define F_A	4
# define F_L	8
# define F_R	16
# define F_T	32

typedef struct		s_ls
{
	char			*name;
	struct s_ls		*next;
	struct stat		*stat;
}					t_ls;

void				error(char *str);

t_ls				*sort_no_flag(t_ls *tmp, t_ls *tmp2, int *flag, int f);
t_ls				*sort_r_flag(t_ls *tmp, t_ls *tmp2, int *flag, int f);
t_ls				*sort_t_flag(t_ls *tmp, t_ls *tmp2, int *flag, int f);
t_ls				*sorting(t_ls *ls, int a, t_ls *f(t_ls*, t_ls*, int*, int));
t_ls				*ls_sorting(t_ls *ls, int flag);

int					check_flags(char *str, int flags);
t_ls				*list_ls_init(t_ls *t, char *name);
int					check_input(int argc, char **argv, t_ls **ls);
t_ls				*init_dir(DIR *dir);

#endif