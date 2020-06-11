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

char	*make_path(char *path, char *name)
{
	int		n;
	int		i;
	char	*full_path;

	n = ft_strlen(name);
	(path[0]) ? n += ft_strlen(path) + 1 : 0;
	full_path = (char*)malloc(sizeof(char) * (n + 1));
	i = -1;
	while (path[++i])
		full_path[i] = path[i];
	if (i && !(path[0] == '/' && path[1] == '\0'))
		full_path[i++] = '/';
	while (i < n && *name)
		full_path[i++] = *name++;
	full_path[i] = '\0';
	return (full_path);
}

t_ls	*new_file(char *path, char *name, t_stat *stat)
{
	t_ls	*file;

	if (!(file = (t_ls*)malloc(sizeof(t_ls)))
		|| !(file->name = ft_strdup(name))
		|| !(file->path = make_path(path, name)))
		ls_error("name", 0);
	file->stat = stat;
	file->next = NULL;
	return (file);	
}

int		add_new_file(char *path, char *name, t_ls **file)
{
	t_stat	*stat;
	char	*full_name;
	t_ls	*tmp;

	tmp = *file;
	stat = (t_stat*)malloc(sizeof(t_stat));
	full_name = make_path(path, name);
	if ((lstat(full_name, stat)) == -1)
	{
		ft_printf("ooo\n");
		return (-1);
	}
	if (*file == NULL)
	{
		*file = new_file(path, name, stat);
	}
	else
	{
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new_file(path, name, stat);
	}
	return (1);
}
