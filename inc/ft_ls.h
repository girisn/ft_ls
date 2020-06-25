#ifndef FT_LS_H
#define FT_LS_H

#define _GNU_SOURCE
#define STAT_HAVE_NSEC 1

#include <sys/param.h>

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
//# include <uuid/uuid.h>
# include <sys/acl.h>
# include <limits.h>
# include <sys/sysmacros.h>
# include <acl/libacl.h>
# include <errno.h>


# define F_A	1
# define F_C	2
# define F_D	4
# define F_F	8
# define F_BF	16
# define F_BG	32
# define F_I	64
# define F_L	128
# define F_M	256
# define F_N	512
# define F_O	1024
# define F_P	2048
# define F_R	4096
# define F_BR	8192
# define F_S	16384
# define F_BS	32768
# define F_T	65536
# define F_U	131072
# define F_ONE	262144

# define C_NO	"\x1b[0m"

typedef struct			stat t_stat;
typedef struct winsize	t_winsize;

typedef struct		s_ls
{
	char			*name;
	char			*path;
	t_stat			*stat;
	char			*color;
	struct s_ls		*next;
	int				n;
}					t_ls;


int		check_dots(char *s1, char *s2);
t_ls	*sort_list(t_ls *ls, int flag);

int		add_new_file(char *path, char *name, t_ls **file, int n);

int		ls_error(char *str, int n);
void	free_list(t_ls **ls);

int		set_flags(int argc, char **argv, int *flags, int *spec);

int		print_list(t_ls *ls, int args, int flags, int n);
int		print_basic(t_ls *ls, int flags);
int		print_table(t_ls *ls, int flags);

void	ls_type(t_stat *stat);
void	ls_mode(mode_t mode, int *n);
void	print_time(t_ls *ls, int flag);
int		print_fp_option(t_ls *ls, int flags);
long unsigned	block_size(t_ls *ls);

void	print_l_options(t_ls *ls, int *n, int flag);
int		check_size(t_ls *ls, int **n, int flags);

char	*make_color(mode_t mode);
int		ft_strcmp_abc(char *s1, char *s2, int n, int m);

int		ft_numlen(long long int n);
int		print_path(t_ls *ls, int args, int n, int flags);
void	print_str(int len, int n, char *str, long long int num);
int		print_fp_option(t_ls *ls, int flags);

int		set_size(t_ls *ls, int **n, int flags);

void	print_m_list(t_ls *ls, int flags);

#endif