#include "ft_ls.h"

void	ft_error(char *str)
{
	perror(str);
	exit(1);
}

int		check_flags(char *str, int flags)
{
	int		i;

	i = 0;
	while (str[++i])
	{
		if (str[i] == 'R')
			(!(flags & F_BR)) ? flags |= F_BR : 0;
		else if (str[i] == 'l')
			(!(flags & F_L)) ? flags |= F_L : 0;
		else if (str[i] == 'a')
			(!(flags & F_A)) ? flags |= F_A : 0;
		else if (str[i] == 'r')
			(!(flags & F_R)) ? flags |= F_R : 0;
		else if (str[i] == 't')
			(!(flags & F_T)) ? flags |= F_T : 0;
	}
	return (flags);
}

int		check_input(int argc, char **argv, t_ls **files)
{
	int		i;
	int		flags;
	t_ls	*tmp;

	i = 0;
	flags = 0;
	tmp = NULL;
	while (++i < argc)
	{
		if (argv[i][0] == '-')
			flags = check_flags(argv[i], flags);
		else if (tmp == NULL)
		{
			tmp = (t_ls*)malloc(sizeof(t_ls));
			tmp->name = argv[i];
			tmp->next == NULL;
			*files = tmp;
		}
		else
		{
			tmp->next = (t_ls*)malloc(sizeof(t_ls));
			tmp = tmp->next;
			tmp->name = argv[i];
			tmp->next = NULL;
		}
	}
	return (flags);
}

void	ft_read_dir(char *name, int flags)
{
	DIR				*dir;
	struct dirent	*d;


	d = readdir(dir);
	while (d != NULL)
	{
		(flags & F_A || (!(flags & F_A) && d->d_name[0] != '.')) ?
			ft_printf("%s\n", d->d_name) : 0;
		d = readdir(dir);
	}
	closedir(dir);
}

int		main(int argc, char **argv)
{
	int		flags;
	t_ls	*ls;
	DIR		*dir;
	struct dirent *d;

	ls = NULL;
	if ((dir = opendir(".")) == NULL)
		ft_error(NULL);
	flags = check_input(argc, argv, &ls);

	exit(0);
}