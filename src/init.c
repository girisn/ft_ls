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

char	*make_dir_name(char *new_name, char *prev_name)
{
	char	*name;

	if (prev_name == NULL)
		return (new_name);
	else if (prev_name[ft_strlen(prev_name) - 1] == '/')
		name = ft_strjoin(prev_name, new_name);
	else
	{
		name = ft_strnew(ft_strlen(prev_name) + ft_strlen(new_name) + 1);
		name = ft_strcat(name, prev_name);
		name = ft_strcat(name, "/");
		name = ft_strcat(name, new_name);
	}
	return (name);
}

struct stat	*list_stat_init(char *name, char *name_dir)
{
	struct stat *s;
	char		*full_name;

	if (!(s = (struct stat*)malloc(sizeof(struct stat))))
		error_exit(NULL);
	full_name = make_dir_name(name, name_dir);
	if ((stat(full_name, s)) == -1)
	{
		error(name);
		(name_dir) ? free(full_name) : 0;
		free(s);
		return (NULL);
	}
	(name_dir) ? free(full_name) : 0;
	return (s);
}

t_ls	*list_ls_init(t_ls *t, char *name, char *path)
{
	struct stat		*s;

	if ((s = list_stat_init(name, path)) == NULL)
		return (t);
	if (t == NULL)
	{
		if (!(t = (t_ls*)malloc(sizeof(t_ls))))
			error(NULL);
	}
	else
	{
		if (!(t->next = (t_ls*)malloc(sizeof(t_ls))))
			error_exit(NULL);
		t = t->next;
	}
	ft_bzero(t, sizeof(t));
	t->stat = s;
	t->name = name;
	t->name_dir = path;
	t->next = NULL;
	t->down = NULL;
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
			tmp = list_ls_init(tmp, argv[i], NULL);
			*ls = tmp;
		}
		else
			tmp = list_ls_init(tmp, argv[i], NULL);
	return (flags);
}

t_ls	*init_dir(DIR *dir, char *path)
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
			tmp = list_ls_init(tmp, d->d_name, path);
			ls = tmp;
		}
		else
			tmp = list_ls_init(tmp, d->d_name, path);
		d = readdir(dir);
	}
	return (ls);
}
