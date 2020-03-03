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

# define F_BR	1
# define F_A	2
# define F_L	4
# define F_R	8
# define F_T	16

typedef struct		s_ls
{
	char			*name;
	struct s_ls		*next;
}					t_ls;

#endif