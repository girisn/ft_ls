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
}					t_ls;

void				error(char *str);

t_ls				*sort_no_flag(t_ls *tmp, int *flag, int f);
t_ls				*sort_r_flag(t_ls *tmp, int *flag, int f);
t_ls				*sort_t_flag(t_ls *tmp, int *flag, int f);


#endif