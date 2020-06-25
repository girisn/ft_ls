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
	else if (flags & F_M)
		print_m_list(ls, flags);
	else
		print_basic(ls, flags);
	return (1);
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
			add_new_file(ls->path, dir->d_name, &tmp, 0);
	if (folder)
		closedir(folder);
	return (tmp);
}

int		print_first(t_ls *ls, int args, int flags, int num)
{
	int		n;
	t_stat	*s;
	int		*block;

	n = num;
	if (num == 0)
		return (num);
	if (flags & F_L)
		check_size(ls, &block, flags);
	if (args || flags & F_D)
		while (ls)
		{
			if (!S_ISDIR(ls->stat->st_mode) || flags & F_D)
			{
				if (flags & F_L)
					print_l_options(ls, block, flags);
				else
					ft_printf("%s\n", ls->name);
				n = 0;
			}
			ls = ls->next;
		}
	if (flags & F_L)
		free(block);
	return (n);
}

int		print_list(t_ls *ls, int args, int fl, int n)
{
	t_ls	*tmp;
	int		perm;

	if (ls == NULL || (!(fl & F_BR) && n != 1))
		return (1);
	tmp = ls;
	n = print_first(tmp, args, fl, n);
	if (fl & F_D)
		return (1);
	while (tmp)
	{
		if ((S_ISDIR(tmp->stat->st_mode) && (n || (ft_strcmp(tmp->name, "..")
			&& ft_strcmp(tmp->name, ".")) || tmp->n == 1)))
		{
			ls = read_folder(tmp, fl, &perm);
			n = (perm) ? print_path(tmp, args, n, fl) : 0;
			(fl & F_L && perm) ? ft_printf("total %lu\n", block_size(ls)) : 0;
			if (ls)
			{
				(!(fl & F_F)) ? sort_list(ls, fl) : 0;
				print_content(ls, fl);
				(fl & F_BR) ? print_list(ls, args, fl, 0) : 0;
				free_list(&ls);
			}
		}
		tmp = tmp->next;
	}
	return (1);
}
