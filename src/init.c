/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/06 18:42:19 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 18:48:06 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int		check_flags(char *str, int flags)
{
	int		i;

	i = 0;
	while (str[++i])
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
		else
			return (ft_printf("usage: ./ft_ls [-Ralrt] [file ...]\n"));
	return (flags);
}

t_ls	*list_ls_init(t_ls *t, char *name)
{
	if (t == NULL)
	{
		if (!(t = (t_ls*)malloc(sizeof(t_ls))))
			error(NULL);
	}
	else
	{
		if (!(t->next = (t_ls*)malloc(sizeof(t_ls))))
			error(NULL);
		t = t->next;
	}
	ft_bzero(t, sizeof(t));
	t->stat = (struct stat*)malloc(sizeof(struct stat));
	t->name = name;
	if ((stat(name, t->stat)) == -1)
	{
		error(name);
		t->name = NULL;
	}
	t->next = NULL;
	return (t);
}

int		check_input(int argc, char **argv, t_ls **ls)
{
	int		i;
	int		flags;
	t_ls	*tmp;

	i = 0;
	flags = 0;
	tmp = NULL;
	while (++i < argc)
		if (argv[i][0] == '-')
			flags = check_flags(argv[i], flags);
		else if (tmp == NULL)
		{
			flags |= (!(flags & F_FILE)) ? F_FILE : 0;
			tmp = list_ls_init(tmp, argv[i]);
			*ls = tmp;
		}
		else
			tmp = list_ls_init(tmp, argv[i]);
	return (flags);
}

t_ls	*init_dir(DIR *dir)
{
	struct dirent	*d;
	t_ls			*tmp;
	t_ls			*ls;

	tmp = NULL;
	d = readdir(dir);
	while (d != NULL)
	{
		if (tmp == NULL)
		{
			tmp = list_ls_init(tmp, d->d_name);
			ls = tmp;
		}
		else
			tmp = list_ls_init(tmp, d->d_name);
		d = readdir(dir);
	}
	return (ls);
}
