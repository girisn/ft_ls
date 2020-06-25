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

int		print_path(t_ls *ls, int args, int n, int flags)
{
	if (flags & F_BR && n && !args)
	{
		ft_printf(".:\n");
		return (0);
	}
	if (!n)
		ft_printf("\n%s:\n", ls->path);
	else if ((args && args != 1) || (flags & F_A && flags & F_BR) ||
		(flags & F_BR && args))
		ft_printf("%s:\n", ls->path);
	return (0);
}

int		check_size(t_ls *ls, int **n, int flags)
{
	int		tmp;
	int		i;

	tmp = 0;
	i = -1;
	if (!ls)
		return (0);
	if (!(*n = (int*)malloc(sizeof(int) * 9)))
		ls_error("malloc", -1);
	while (++i < 9)
		(*n)[i] = 0;
	while (ls)
	{
		set_size(ls, n, flags);
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
