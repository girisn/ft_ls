#include "ft_ls.h"

int		ls_error(char *str, int n)
{
	if (n == 1)
	{
		ft_putstr_fd("ft_ls: illegal option -", 2);
		ft_putchar_fd(str[0], 2);
		ft_putendl_fd("\nusage: ft_ls [-alRrt] [file ...]", 2);
		exit(EXIT_FAILURE);
	}
	else // if (n == 0)
	{
		ft_putstr_fd("ft_ls: ", 2);
		perror(str);
	}
	if (n == 2)
		exit(EXIT_FAILURE);
	return (0);
}

t_ls	*init_list(int count, char **files, int flags)
{
	t_ls	*start;
	int		i;

	(void)flags;
	i = -1;
	start = NULL;
	(!count) ? add_new_file("", ".", &start) : 0;
//	ft_printf("000");
	while (++i < count)
		if ((add_new_file("", files[i], &start)) == -1)
			ls_error(files[i], 0);
//	ft_printf("111");
	sort_list(start, flags);
	return (start);
}

t_ls	*read_folder(t_ls *ls, int flags)
{
	t_ls			*tmp;
	DIR				*folder;
	struct dirent	*dir;

	tmp = NULL;
	if (!(folder = opendir(ls->path)))
		ls_error(ls->path, 2);
	while ((dir = readdir(folder)))
		if (dir->d_name[0] != '.' || flags & F_A)
		{
		//	ft_printf("name1 = %s\n", dir->d_name);
			add_new_file(ls->path, dir->d_name, &tmp);
		//	ft_printf("name = %s, tmp-name = %s\n", dir->d_name, tmp->name);
		}
	if (folder)
		closedir(folder);
	return (tmp);
}

void	free_list(t_ls **ls)
{
	t_ls	*tmp;

	while (*ls)
	{
		tmp = (*ls)->next;
		free((*ls)->name);
		free((*ls)->path);
		free((*ls)->stat);
		(*ls)->next = NULL;
		free(*ls);
		*ls = tmp;
	}
}

void	ls_type(t_stat *stat)
{
	if (S_ISLNK(stat->st_mode))
		ft_printf("l");
	else if (S_ISREG(stat->st_mode))
		ft_printf("-");
	else if (S_ISDIR(stat->st_mode))
		ft_printf("d");
	else if (S_ISCHR(stat->st_mode))
		ft_printf("c");
	else if (S_ISBLK(stat->st_mode))
		ft_printf("b");
	else if (S_ISFIFO(stat->st_mode))
		ft_printf("p");
	else if (S_ISSOCK(stat->st_mode))
		ft_printf("s");
}

void	ls_mode(mode_t mode)
{
	ft_printf("%c", (S_IRUSR & mode) ? 'r' : '-');
	ft_printf("%c", (S_IWUSR & mode) ? 'w' : '-');
	(S_ISUID & mode) ? ft_printf("%c", (S_IXUSR & mode) ? 'S' : 's')
		: ft_printf("%c", (S_IXUSR & mode) ? 'x' : '-');
	ft_printf("%c", (S_IRGRP & mode) ? 'r' : '-');
	ft_printf("%c", (S_IWGRP & mode) ? 'w' : '-');
	(S_ISGID & mode) ? ft_printf("%c", (S_IXGRP & mode) ? 'S' : 's')
		: ft_printf("%c", (S_IXGRP & mode) ? 'x' : '-');
	ft_printf("%c", (S_IROTH & mode) ? 'r' : '-');
	ft_printf("%c", (S_IWOTH & mode) ? 'w' : '-');
//	(S_ISVTX & mode) ? ft_printf("%c ", (S_IXOTH & mode) ? 'T' : 't') :
		ft_printf("%c ", (S_IXOTH & mode) ? 'x' : '-');
}

int		ft_numlen(long long int n)
{
	int		len;

	len = 0;
	if (n == 0)
		return (1);
	while (n > 0)
	{
		len++;
		n /= 10;
	}
	return (len);
}

void	check_size(t_ls *ls, int **n)
{
	int		tmp;
	int		i;

	tmp = 0;
	i = -1;
	*n = (int*)malloc(sizeof(int) * 7);
	while (++i < 8)
		(*n)[i] = 0;
	while (ls)
	{
		((*n)[0] < (tmp = ft_numlen(ls->stat->st_nlink))) ? (*n)[0] = tmp : 0;
		((*n)[1] < (tmp = ft_strlen(getpwuid(ls->stat->st_uid)->pw_name))) ? (*n)[1] = tmp : 0;
		((*n)[2] < (tmp = ft_strlen(getgrgid(ls->stat->st_gid)->gr_name))) ? (*n)[2] = tmp : 0;
		((*n)[3] < (tmp = ft_numlen(ls->stat->st_size))) ? (*n)[3] = tmp : 0;
		ls = ls->next;
	}
}

void	print_str(int len, int n, char *str, long long int num)
{
	int		i;
	int		space;

	i = -1;
	space = (n == 0) ? len - ft_strlen(str) : len - ft_numlen(num);
	if (n == 0)
		ft_printf("%s", str);
	while (++i < space)
		ft_putchar(' ');
	if (n == 1)
		ft_printf("%lld", num);
	ft_putchar(' ');
}

void	print_time(t_ls *ls)
{
	time_t	ttime;
	char	*str;

	time(&ttime);
	str = ctime(&(ls->stat->st_mtime)) + 4;
	if (time(&ttime) - time(&(ls->stat->st_mtime)) > 15789600)
	{
		ft_printf("%.7s", str);
		ft_printf("%s\n", str + 16);
	}
	ft_printf("%.12s ", str);
}

int		print_table(t_ls *ls, int flags)
{
	int		*n;

	check_size(ls, &n);

	

	sort_list(ls, flags);
	ft_printf("total \n");
	while (ls)
	{
		ls_type(ls->stat);
		ls_mode(ls->stat->st_mode);
		print_str(n[0], 1, NULL, ls->stat->st_nlink);
		print_str(n[1], 0, getpwuid(ls->stat->st_uid)->pw_name, 0);
		print_str(n[2], 0, getgrgid(ls->stat->st_gid)->gr_name, 0);
		print_str(n[3], 1, NULL, ls->stat->st_size);
		print_time(ls);
		ft_printf("%s\n", ls->name);
		ls = ls->next;
	}
	return (1);
}

int		ls_maxlen(t_ls *ls, int *av, int *n)
{
	int		max;
	int		tmp;

	max = 0;
	tmp = 0;
	*av = 0;
	*n = 0;
	while (ls)
	{
		if ((tmp = ft_strlen(ls->name)) > max)
			max = tmp;
		*av += tmp;
		(*n)++;
		ls = ls->next;
	}
	*av /= *n;
	return (max);
}

int		print_basic(t_ls *ls, int flags)
{
//	int				max_len;
//	int				av;
//	int				num;
//	struct winsize	*ws;

	sort_list(ls, flags);
//	ws = (struct winsize*)malloc(sizeof(struct winsize));
//	if (flags & F_ONE)
		while (ls)
		{
			ft_printf("%s\n", ls->name);
			ls = ls->next;
		}
/*	else
	{
		max_len = ls_maxlen(ls, &av, &num);
		ioctl(0, TIOCGWINSZ, ws);
		ft_printf("col = %d, row = %d, len = %d, num = %d\n", ws->ws_col, ws->ws_row, max_len, num);
	}*/
	return (1);
}

int		print_content(t_ls *ls, int flags)
{
	if (flags & F_L)
		print_table(ls, flags);
	else
		print_basic(ls, flags);
	return (1);
}

int		print_path(t_ls *ls, int args, int n)
{
	if (!n)
		ft_printf("\n%s:\n", ls->path);
	else if (args && args != 1)
		ft_printf("%s:\n", ls->path);
	return (1);
}

int		print_list(t_ls *ls, int args, int flags, int n)
{
	t_ls	*tmp;

	if (ls == NULL || (!(flags & F_BR) && n != 1))
		return (1);
	sort_list(ls, flags);
	tmp = ls;
	while (tmp)
	{
		if ((S_ISDIR(tmp->stat->st_mode) && ft_strcmp(tmp->name, "..")
				&& ft_strcmp(tmp->name, ".")) || (n && !args))
		{
			print_path(tmp, args, n);
			ls = read_folder(tmp, flags);
			if (ls)
			{
				print_content(ls, flags);
				n = 0;
				print_list(ls, args, flags, 0);
				free_list(&ls);
			}
		}
		else if (args)
		{
			ft_printf("%s\n", tmp->name);
			n = 0;
		}
		tmp = tmp->next;
	}
	return (1);
}

int		main(int argc, char **argv)
{
	int		flags;
	int		i;
	int		args;
	t_ls	*ls;

	if ((i = set_flags(argc, argv, &flags)) == -1)
		return (1);
	argc -= i;
	argv += i;
	args = (argv[0] == NULL) ? 0 : argc;
	ls = init_list(argc, argv, flags);
//	ft_printf("%s, %s, isdir = %d\n", ls->path, ls->name, S_ISDIR(ls->stat->st_mode));
//	ft_printf("%s, %d\n", argv[0], args);
	print_list(ls, args, flags, 1);
	exit(0);
	return (0);
}