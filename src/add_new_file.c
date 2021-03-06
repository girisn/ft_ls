/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   add_new_file.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

char	*make_color(mode_t mode)
{
	if (S_ISDIR(mode))
		return (ft_strdup("\x1b[01;34m"));
	else if (S_ISREG(mode) && (S_IXUSR & mode
	|| S_IXGRP & mode || S_IXOTH & mode))
		return (ft_strdup("\x1b[01;32m"));
	else if (S_ISLNK(mode))
		return (ft_strdup("\x1b[01;36m"));
	else if (S_ISFIFO(mode))
		return (ft_strdup("\x1b[40;33m"));
	else if (S_ISSOCK(mode))
		return (ft_strdup("\x1b[01;35m"));
	else if (S_ISBLK(mode) || S_ISCHR(mode))
		return (ft_strdup("\x1b[40;33;01m"));
	else if (S_ISUID & mode)
		return (ft_strdup("\x1b[37;41m"));
	else if (S_ISGID & mode)
		return (ft_strdup("\x1b[30;43m"));
	else if (__S_ISVTX & mode && S_IWOTH & mode)
		return (ft_strdup("\x1b[30;42m"));
	else if (!(__S_ISVTX & mode) && S_IWOTH & mode)
		return (ft_strdup("\x1b[34;42m"));
	else if (__S_ISVTX & mode && !(S_IWOTH & mode))
		return (ft_strdup("\x1b[37;44m"));
	return (ft_strdup("\x1b[0m"));
}

char	*make_path(char *path, char *name)
{
	int		n;
	int		i;
	char	*full_path;
	int		tmp;

	n = ft_strlen(name);
	tmp = 0;
	(path[0]) ? n += ft_strlen(path) + 1 : 0;
	if (n)
		if (!(full_path = (char*)malloc(sizeof(char) * (n + 1))))
			ls_error("malloc", -1);
	i = -1;
	while (path[++i])
	{
		(path[i] == '/' && path[i + 1] == '\0') ? tmp = 1 : 0;
		full_path[i] = path[i];
	}
	if (i > 0 && !(path[0] == '/' && path[1] == '\0') && tmp == 0)
		full_path[i++] = '/';
	while (i < n && *name)
		full_path[i++] = *name++;
	full_path[i] = '\0';
	return (full_path);
}

t_ls	*new_file(char **path, char *name, t_stat *stat, int n)
{
	t_ls	*file;

	file = NULL;
	if (!name || !stat)
	{
		free(*path);
		free(stat);
		return (NULL);
	}
	if (!(file = (t_ls*)malloc(sizeof(t_ls))))
		ls_error("malloc", -1);
	if (!(file->name = ft_strdup(name)))
		ls_error("malloc", -1);
	if (!(file->color = make_color(stat->st_mode)))
		ls_error("malloc", -1);
	file->path = *path;
	file->stat = stat;
	file->next = NULL;
	file->n = n;
	return (file);
}

t_stat	*make_stat(char *name, int n)
{
	t_stat	*st;

	if (!(st = (t_stat*)malloc(sizeof(t_stat))))
		ls_error("malloc", -1);
	if ((lstat(name, st)) == -1)
	{
		free(st);
		return (NULL);
	}
	if (n == 1 && S_ISLNK(st->st_mode) && n != 2)
		if ((stat(name, st)) == -1)
			if ((lstat(name, st)) == -1)
			{
				free(st);
				return (NULL);
			}
	return (st);
}

int		add_new_file(char *path, char *name, t_ls **file, int n)
{
	t_stat	*st;
	char	*full_name;
	t_ls	*tmp;

	tmp = *file;
	if (!(full_name = make_path(path, name)))
		ls_error("malloc", -1);
	if (!(st = make_stat(full_name, n)))
	{
		free(full_name);
		return (0);
	}
	if (*file == NULL)
		*file = new_file(&full_name, name, st, (n == 2) ? 1 : n);
	else
	{
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new_file(&full_name, name, st, (n == 2) ? 1 : n);
	}
	return (1);
}
