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

int		ft_numlen(long long int n)
{
	int		len;

	len = 0;
	if (n == 0)
		return (1);
	while (n > 0)
	{
		len++;
		n /= 10;
	}
	return (len);
}

int		set_size(t_ls *ls, int **n)
{
	int		tmp;

	tmp = 0;
	((*n)[0] < (tmp = ft_numlen(ls->stat->st_nlink)))
		? (*n)[0] = tmp : 0;
	((*n)[1] < (tmp = ft_strlen(getpwuid(ls->stat->st_uid)->pw_name)))
		? (*n)[1] = tmp : 0;
	((*n)[2] < (tmp = ft_strlen(getgrgid(ls->stat->st_gid)->gr_name)))
		? (*n)[2] = tmp : 0;
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
	return (1);
}

int		check_size(t_ls *ls, int **n)
{
	int		tmp;
	int		i;

	tmp = 0;
	i = -1;
	if (!ls)
		return (0);
	if (!(*n = (int*)malloc(sizeof(int) * 7)))
		ls_error("malloc", -1);
	while (++i < 7)
		(*n)[i] = 0;
	while (ls)
	{
		set_size(ls, n);
		ls = ls->next;
	}
	return (1);
}

void	print_str(int len, int n, char *str, long long int num)
{
	int		i;
	int		space;

	i = -1;
	space = (n == 0) ? len - ft_strlen(str) : len - ft_numlen(num);
	if (n == 0 && str)
		ft_printf("%s", str);
	while (++i < space)
		ft_putchar(' ');
	if (n == 1 || n == 2)
		ft_printf("%lld", num);
	(n == 2) ? ft_putstr(", ") : ft_putchar(' ');
}

void	print_name(t_ls *ls, int flags)
{
	char	buf[NAME_MAX + 1];
	char	*color;
	t_stat	*st;

	if (!S_ISLNK(ls->stat->st_mode))
		(flags & F_BG) ? ft_printf("%s%s%s\n", ls->color, ls->name, C_NO)
			: ft_printf("%s\n", ls->name);
	else
	{
		ft_bzero(buf, NAME_MAX + 1);
		readlink(ls->path, buf, NAME_MAX);
		st = (t_stat*)malloc(sizeof(t_stat));
		if ((stat(buf, st)) == -1)
		{
			color = ft_strdup("\x1b[01;40;31m");
			free(ls->color);
			ls->color = ft_strdup(color);
		}
		else
			color = make_color(st->st_mode);
		free(st);
		(flags & F_BG) ? ft_printf("%s%s%s -> ", ls->color, ls->name, C_NO)
			: ft_printf("%s -> ", ls->name);
		(flags & F_BG) ? ft_printf("%s%s%s\n", color, buf, C_NO)
			: ft_printf("%s\n", buf);
		free(color);
	}
}

void	print_l_options(t_ls *ls, int *n, int flag)
{
	acl_t	atr;

	ls_type(ls->stat);
	n[6] = (acl_extended_file_nofollow(ls->path) == 1 &&
		!S_ISLNK(ls->stat->st_mode)) ? 1 : 0;
	ls_mode(ls->stat->st_mode, n);
	print_str(n[0], 1, NULL, ls->stat->st_nlink);
	print_str(n[1], 0, getpwuid(ls->stat->st_uid)->pw_name, 0);
	print_str(n[2], 0, getgrgid(ls->stat->st_gid)->gr_name, 0);
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
}

int		print_table(t_ls *ls, int flags)
{
	int				*n;
	short unsigned	size;

	n = NULL;
	if (!(check_size(ls, &n)))
		return (0);
	sort_list(ls, flags);
	while (ls)
	{
		print_l_options(ls, n, flags);
		ls = ls->next;
	}
	free(n);
	return (1);
}
