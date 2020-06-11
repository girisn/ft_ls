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

t_ls	*init_list(int count, char **files, int flags)
{
	t_ls	*start;
	int		i;

	(void)flags;
	i = -1;
	start = NULL;
	(!count) ? add_new_file("", ".", &start) : 0;
	while (++i < count)
		if ((add_new_file("", files[i], &start)) == -1)
			ls_error(files[i], 0);
	sort_list(start, flags);
	return (start);
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
	print_list(ls, args, flags, 1);
	return (0);
}
