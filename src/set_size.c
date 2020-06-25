/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_print_table.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int		set_size_helper(t_ls *ls, int **n, int flags)
{
	int		tmp;

	tmp = 0;
	if (!S_ISCHR(ls->stat->st_mode) && !S_ISBLK(ls->stat->st_mode))
		((*n)[4] < (tmp = ft_numlen(ls->stat->st_size)))
			? (*n)[4] = tmp : 0;
	else
	{
		((*n)[3] < (tmp = ft_numlen(major(ls->stat->st_rdev))))
			? (*n)[3] = tmp : 0;
		((*n)[4] < (tmp = ft_numlen(minor(ls->stat->st_rdev))))
			? (*n)[4] = tmp : 0;
	}
	if (!S_ISLNK(ls->stat->st_mode) && !S_ISDIR(ls->stat->st_mode)
		&& acl_extended_file_nofollow(ls->path))
		(*n)[5] = 1;
	if (flags & F_S)
		((*n)[7] < (tmp = ft_numlen(ls->stat->st_blocks / 2)))
			? (*n)[7] = tmp : 0;
	if (flags & F_I)
		(((*n)[8]) < (tmp = ft_numlen(ls->stat->st_ino)))
			? (*n)[8] = tmp : 0;
	return (1);
}

int		set_size(t_ls *ls, int **n, int flags)
{
	int		tmp;

	tmp = 0;
	((*n)[0] < (tmp = ft_numlen(ls->stat->st_nlink)))
		? (*n)[0] = tmp : 0;
	if (!(flags & F_N))
		((*n)[1] < (tmp = ft_strlen(getpwuid(ls->stat->st_uid)->pw_name)))
			? (*n)[1] = tmp : 0;
	else
		((*n)[1] < (tmp = ft_numlen(ls->stat->st_uid)))
			? (*n)[1] = tmp : 0;
	if (!(flags & F_O) && !(flags & F_N))
		((*n)[2] < (tmp = ft_strlen(getgrgid(ls->stat->st_gid)->gr_name)))
			? (*n)[2] = tmp : 0;
	else if (!(flags & F_O))
		((*n)[2] < (tmp = ft_numlen(ls->stat->st_gid)))
			? (*n)[2] = tmp : 0;
	set_size_helper(ls, n, flags);
	return (1);
}
