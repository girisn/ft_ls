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
	else // if (n == 0)
	{
		(n == 2) ? ft_putstr_fd("ls: cannot open directory '", 2) :
			ft_putstr_fd("ls: cannot access '", 2);
		ft_putstr_fd(str, 2);
		ft_putstr_fd("': ", 2);
		(n == 4) ? ft_putstr_fd("No such file or directory\n", 2) : perror(NULL);
	}
//	if (n == 2)
//		exit(EXIT_FAILURE);
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

t_ls	*init_list(int count, char **files, int flags, int spec)
{
	t_ls	*start;
	int		i;

	i = -1;
	start = NULL;
	(!count) ? add_new_file("", ".", &start) : 0;
	while (++i < count)
	{
		if (spec == 0 && !ft_strcmp(files[i], "--"))
			spec = 1;
		else if ((add_new_file("", files[i], &start)) == -1)
			ls_error(files[i], 0);
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

	if ((i = set_flags(argc, argv, &flags, &spec)) == -1)
		return (1);
	argc -= i;
	argv += i;
	args = (argv[0] == NULL) ? 0 : argc;
	ls = init_list(argc, argv, flags, spec);
	print_list(ls, args, flags, 1);
	return (0);
}
