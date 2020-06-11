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

void	check_size(t_ls *ls, int **n)
{
	int		tmp;
	int		i;

	tmp = 0;
	i = -1;
	*n = (int*)malloc(sizeof(int) * 7);
	while (++i < 8)
		(*n)[i] = 0;
	while (ls)
	{
		((*n)[0] < (tmp = ft_numlen(ls->stat->st_nlink)))
			? (*n)[0] = tmp : 0;
		((*n)[1] < (tmp = ft_strlen(getpwuid(ls->stat->st_uid)->pw_name)))
			? (*n)[1] = tmp : 0;
		((*n)[2] < (tmp = ft_strlen(getgrgid(ls->stat->st_gid)->gr_name)))
			? (*n)[2] = tmp : 0;
		((*n)[3] < (tmp = ft_numlen(ls->stat->st_size))) ? (*n)[3] = tmp : 0;
		ls = ls->next;
	}
}

void	print_str(int len, int n, char *str, long long int num)
{
	int		i;
	int		space;

	i = -1;
	space = (n == 0) ? len - ft_strlen(str) : len - ft_numlen(num);
	if (n == 0)
		ft_printf("%s", str);
	while (++i < space)
		ft_putchar(' ');
	if (n == 1)
		ft_printf("%lld", num);
	ft_putchar(' ');
}

int		print_table(t_ls *ls, int flags)
{
	int			*n;
	short unsigned	size;

	check_size(ls, &n);
	sort_list(ls, flags);
	ft_printf("total %hu\n", block_size(ls));
	while (ls)
	{
		ls_type(ls->stat);
		ls_mode(ls->stat->st_mode);
		print_str(n[0], 1, NULL, ls->stat->st_nlink);
		print_str(n[1], 0, getpwuid(ls->stat->st_uid)->pw_name, 0);
		print_str(n[2], 0, getgrgid(ls->stat->st_gid)->gr_name, 0);
		print_str(n[3], 1, NULL, ls->stat->st_size);
		print_time(ls);
		ft_printf("%s\n", ls->name);
		ls = ls->next;
	}
	free(n);
	return (1);
}
