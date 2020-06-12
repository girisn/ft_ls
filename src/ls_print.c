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

int		print_path(t_ls *ls, int args, int n, int flags)
{
	if (!n)
		ft_printf("\n%s:\n", ls->path);
	else if ((args && args != 1) || (flags & F_A && flags & F_BR) ||
		(flags & F_BR && args))
		ft_printf("%s:\n", ls->path);
	return (0);
}

t_ls	*read_folder(t_ls *ls, int flags, int *perm)
{
	t_ls			*tmp;
	DIR				*folder;
	struct dirent	*dir;

	tmp = NULL;
	*perm = 1;
	if (!(folder = opendir(ls->path)))
	{
		*perm = 0;
		ls_error(ls->path, 2);
		return (NULL);
	}
	while ((dir = readdir(folder)))
		if (dir->d_name[0] != '.' || flags & F_A)
			add_new_file(ls->path, dir->d_name, &tmp);
	if (folder)
		closedir(folder);
	return (tmp);
}

int		print_first(t_ls *ls, int args, int flags, int num)
{
	int		n;
	int		*block;

	n = num;
	if (num == 0)
		return (num);
	if (flags & F_L)
		check_size(ls, &block);
	if (args)
		while (ls)
		{
			if (!S_ISDIR(ls->stat->st_mode))
			{
				if (flags & F_L)
					print_l_options(ls, block);
				else
					ft_printf("%s\n", ls->name);
				n = 0;
			}
			ls = ls->next;
		}
	return (n);
}

int		print_list(t_ls *ls, int args, int flags, int n)
{
	t_ls	*tmp;
	int		perm;

	if (ls == NULL || (!(flags & F_BR) && n != 1))
		return (1);
	tmp = ls;
	n = print_first(tmp, args, flags, n);
	while (tmp)
	{
		if (S_ISDIR(tmp->stat->st_mode) && (n || (ft_strcmp(tmp->name, "..")
			&& ft_strcmp(tmp->name, "."))))
		{
			(flags & F_BR && n && !args) ? ft_printf(".:\n") : 0;
			ls = read_folder(tmp, flags, &perm);
			n = (perm) ? print_path(tmp, args, n, flags) : 0;
			(flags & F_L && perm) ? ft_printf("total %hu\n", block_size(ls)) : 0;
			if (ls)
			{
				sort_list(ls, flags);
				print_content(ls, flags);
				print_list(ls, args, flags, 0);
				free_list(&ls);
			}
		}
		tmp = tmp->next;
	}
	return (1);
}
