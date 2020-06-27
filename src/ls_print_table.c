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

void	color_helper(t_ls *ls, int flags, char **color, char buf[NAME_MAX + 1])
{
	t_stat	*st;

	st = NULL;
	if (!(st = (t_stat*)malloc(sizeof(t_stat))))
		ls_error("malloc", -1);
	if ((stat(buf, st)) == -1)
	{
		if (flags & F_BG)
		{
			if (!(*color = ft_strdup("\x1b[01;40;31m")))
				ls_error("malloc", -1);
			if (ls->color)
				free(ls->color);
			if (!(ls->color = ft_strdup("\x1b[01;40;31m")))
				ls_error("malloc", -1);
		}
	}
	else if (flags & F_BG)
		if (!(*color = make_color(st->st_mode)))
			ls_error("malloc", -1);
	if (st)
		free(st);
}

void	print_name_helper(t_ls *ls, int flags)
{
	char	buf[NAME_MAX + 1];
	char	*color;

	color = NULL;
	ft_bzero(buf, NAME_MAX + 1);
	if ((readlink(ls->path, buf, NAME_MAX)) == -1)
		ls_error("readlink", -1);
	color_helper(ls, flags, &color, buf);
	(flags & F_BG) ? ft_printf("%s%s%s -> ", ls->color, ls->name, C_NO)
		: ft_printf("%s -> ", ls->name);
	(flags & F_BG) ? ft_printf("%s%s%s", color, buf, C_NO)
		: ft_printf("%s", buf);
	if (color)
		free(color);
}

void	print_name(t_ls *ls, int flags)
{
	if (!S_ISLNK(ls->stat->st_mode))
		(flags & F_BG) ? ft_printf("%s%s%s", ls->color, ls->name, C_NO)
			: ft_printf("%s", ls->name);
	else
		print_name_helper(ls, flags);
}

void	print_l_options(t_ls *ls, int *n, int flag)
{
	(flag & F_I) ? print_str(n[8], 1, NULL, ls->stat->st_ino) : 0;
	(flag & F_S) ? print_str(n[7], 1, NULL, ls->stat->st_blocks / 2) : 0;
	ls_type(ls->stat);
	n[6] = (acl_extended_file_nofollow(ls->path) == 1 &&
		!S_ISLNK(ls->stat->st_mode)) ? 1 : 0;
	ls_mode(ls->stat->st_mode, n);
	print_str(n[0], 1, NULL, ls->stat->st_nlink);
	(flag & F_N) ? print_str(n[1], 1, NULL, ls->stat->st_uid)
		: print_str(n[1], 0, getpwuid(ls->stat->st_uid)->pw_name, 0);
	if (!(flag & F_O))
		(flag & F_N) ? print_str(n[2], 1, NULL, ls->stat->st_gid)
			: print_str(n[2], 0, getgrgid(ls->stat->st_gid)->gr_name, 0);
	if (!S_ISCHR(ls->stat->st_mode) && !S_ISBLK(ls->stat->st_mode))
	{
		(n[3]) ? print_str(n[3] + 1, 0, NULL, 0) : 0;
		print_str(n[4], 1, NULL, ls->stat->st_size);
	}
	else
	{
		print_str(n[3], 2, NULL, major(ls->stat->st_rdev));
		print_str(n[4], 1, NULL, minor(ls->stat->st_rdev));
	}
	print_time(ls, flag);
	print_name(ls, flag);
	(flag & F_P || flag & F_BF) ? print_fp_option(ls, flag) : ft_putchar('\n');
}

int		print_table(t_ls *ls, int flags)
{
	int				*n;

	n = NULL;
	if (!(check_size(ls, &n, flags)))
		return (0);
	while (ls)
	{
		print_l_options(ls, n, flags);
		ls = ls->next;
	}
	free(n);
	return (1);
}
