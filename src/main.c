/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int		ls_error(char *str, int n)
{
	if (n == 1)
	{
		ft_putstr_fd("ls: illegal option -", 2);
		ft_putchar_fd(str[0], 2);
		ft_putendl_fd("\nusage: ft_ls [-alRrt] [file ...]", 2);
		exit(EXIT_FAILURE);
	}
	else if (n == 3)
	{
		ft_putstr_fd("ls: invalid option -- '", 2);
		ft_putchar_fd(str[0], 2);
		ft_putstr_fd("'\nTry 'ls --help' for more information.\n", 2);
		exit(EXIT_SUCCESS);
	}
	else if (n == -1)
	{
		perror(NULL);
		exit(EXIT_FAILURE);
	}
	else
	{
		(n == 2) ? ft_putstr_fd("ls: cannot open directory '", 2) :
			ft_putstr_fd("ls: cannot access '", 2);
		ft_putstr_fd(str, 2);
		ft_putstr_fd("': ", 2);
		(n == 4) ? ft_putstr_fd("No such file or directory\n", 2) : perror(NULL);
	}
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
		free((*ls)->color);
		(*ls)->next = NULL;
		free(*ls);
		*ls = tmp;
	}
}

t_ls	*init_list(int count, int argc, char **files, int flags)
{
	t_ls	*start;
	int		i;
	int		spec;

	i = 0;
	spec = 0;
	start = NULL;
	if (!count)
		if (!(add_new_file("", ".", &start, 1, flags)))
			ls_error(files[i], 0);
	while (++i < argc)
	{
		if (files[i][0] == '\0')
			ls_error("\0", 4);
		else if (files[i][0] == '-' && !files[i][1])
		{
			if (!(add_new_file("", files[i], &start, 1, flags)))
				ls_error(files[i], 0);
		}
		else if (spec == 0 && files[i][0] == '-' && files[i][1] == '-' && !files[i][2])
			spec = 1;
		else if ((spec == 0 && files[i][0] != '-') || spec == 1)
		{
			if (!(add_new_file("", files[i], &start, 1, flags)))
				ls_error(files[i], 0);
		}
	}
	sort_list(start, flags);
	return (start);
}

int		main(int argc, char **argv)
{
	int		flags;
	int		i;
	int		spec;
	int		args;
	t_ls	*ls;

	ls = NULL;
//	ft_printf("a.zip = *.zip - %d\n", ft_strlen(ft_strstr("abcszip", ".zip")) == 6);
	if ((i = set_flags(argc, argv, &flags, &spec)) == -1)
		return (1);
	args = (spec) ? argc - i - 2 : argc - i - 1;
	ls = init_list(args, argc, argv, flags);
	print_list(ls, args, flags, 1);
	if (ls)
		free_list(&ls);
	return (0);
}
