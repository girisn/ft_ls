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

void	ls_type(t_stat *stat)
{
	if (S_ISLNK(stat->st_mode))
		ft_printf("l");
	else if (S_ISREG(stat->st_mode))
		ft_printf("-");
	else if (S_ISDIR(stat->st_mode))
		ft_printf("d");
	else if (S_ISCHR(stat->st_mode))
		ft_printf("c");
	else if (S_ISBLK(stat->st_mode))
		ft_printf("b");
	else if (S_ISFIFO(stat->st_mode))
		ft_printf("p");
//	else if (__S_IFSOCK & stat->st_mode)
//		ft_printf("s");
}

void	ls_mode(mode_t mode, int *n)
{
	ft_putchar((S_IRUSR & mode) ? 'r' : '-');
	ft_putchar((S_IWUSR & mode) ? 'w' : '-');
	(S_ISUID & mode) ? ft_putchar(!(S_IXUSR & mode) ? 'S' : 's')
		: ft_putchar((S_IXUSR & mode) ? 'x' : '-');
	ft_putchar((S_IRGRP & mode) ? 'r' : '-');
	ft_putchar((S_IWGRP & mode) ? 'w' : '-');
	(S_ISGID & mode) ? ft_putchar(!(S_IXGRP & mode) ? 'S' : 's')
		: ft_putchar((S_IXGRP & mode) ? 'x' : '-');
	ft_putchar((S_IROTH & mode) ? 'r' : '-');
	ft_putchar((S_IWOTH & mode) ? 'w' : '-');
	((__S_ISVTX) & mode) ? ft_putchar(!(S_IXOTH & mode) ? 'T' : 't') :
		ft_putchar((S_IXOTH & mode) ? 'x' : '-');
	if (n[5] == 1)
		(n[6] == 1) ? ft_putchar('+') : ft_putchar(' ');
	ft_putchar(' ');
}

void	print_time(t_ls *ls, int flag)
{
	time_t	ttime;
	time_t	t;
	char	*str;

	t = (flag & F_U) ? ls->stat->st_atime : ls->stat->st_mtime;
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

short unsigned	block_size(t_ls *ls)
{
	long int	size;

	size = 0;
	while (ls)
	{
		size += ls->stat->st_blocks;
		ls = ls->next;
	}
	return (size / 2);
}
