/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_print.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

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
			add_new_file(ls->path, dir->d_name, &tmp);
	if (folder)
		closedir(folder);
	return (tmp);
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
			(flags & F_BR && n && !args) ? ft_printf(".:\n") : 0;
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
