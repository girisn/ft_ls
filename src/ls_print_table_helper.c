/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_l_flag.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

void			ls_type(t_stat *stat)
{
	if (S_ISLNK(stat->st_mode))
		ft_putchar('l');
	else if (S_ISREG(stat->st_mode))
		ft_putchar('-');
	else if (S_ISDIR(stat->st_mode))
		ft_putchar('d');
	else if (S_ISCHR(stat->st_mode))
		ft_putchar('c');
	else if (S_ISBLK(stat->st_mode))
		ft_putchar('b');
	else if (S_ISFIFO(stat->st_mode))
		ft_putchar('p');
	else if (__S_IFSOCK & stat->st_mode)
		ft_putchar('s');
}

void			ls_mode(mode_t mode, int *n)
{
	ft_putchar((S_IRUSR & mode) ? 'r' : '-');
	ft_putchar((S_IWUSR & mode) ? 'w' : '-');
	if (S_ISUID & mode)
		ft_putchar(!(S_IXUSR & mode) ? 'S' : 's');
	else
		ft_putchar((S_IXUSR & mode) ? 'x' : '-');
	ft_putchar((S_IRGRP & mode) ? 'r' : '-');
	ft_putchar((S_IWGRP & mode) ? 'w' : '-');
	if (S_ISGID & mode)
		ft_putchar(!(S_IXGRP & mode) ? 'S' : 's');
	else
		ft_putchar((S_IXGRP & mode) ? 'x' : '-');
	ft_putchar((S_IROTH & mode) ? 'r' : '-');
	ft_putchar((S_IWOTH & mode) ? 'w' : '-');
	if ((__S_ISVTX) & mode)
		ft_putchar(!(S_IXOTH & mode) ? 'T' : 't');
	else
		ft_putchar((S_IXOTH & mode) ? 'x' : '-');
	if (n[5] == 1)
		(n[6] == 1) ? ft_putchar('+') : ft_putchar(' ');
	ft_putchar(' ');
}

void			print_time(t_ls *ls, int flag)
{
	time_t	ttime;
	time_t	t;
	char	*str;

	t = (flag & F_U) ? ls->stat->st_atime : ls->stat->st_mtime;
	(flag & F_C) ? t = ls->stat->st_ctime : 0;
	str = ctime(&t) + 4;
	if (time(&ttime) - t > 15768000 ||
		t - time(&ttime) >= 3600)
	{
		ft_printf("%.7s", str);
		ft_printf(" %.4s ", str + 16);
	}
	else
		ft_printf("%.12s ", str);
}

int		print_fp_option(t_ls *ls, int flags)
{
	if (S_ISDIR(ls->stat->st_mode))
		ft_putchar('/');
	else if (flags & F_BF && S_ISFIFO(ls->stat->st_mode))
		ft_putchar('|');
	else if (flags & F_BF && (S_IXUSR & ls->stat->st_mode
		|| S_IXGRP & ls->stat->st_mode ||
		S_IXOTH & ls->stat->st_mode))
		ft_putchar('*');
	ft_putchar('\n');
	return (1);
}

long unsigned	block_size(t_ls *ls)
{
	long unsigned	size;

	size = 0;
	while (ls)
	{
		size += ls->stat->st_blocks;
		ls = ls->next;
	}
	return (size / 2);
}
