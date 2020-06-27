/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_print_basic.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int		print_one_list(t_ls *ls, int flags)
{
	int		len;
	int		len2;

	len = (flags & F_S) ? ft_intblock_size(ls, 0) : 0;
	len2 = (flags & F_I) ? ft_intblock_size(ls, 1) : 0;
	(flags & F_S) ? ft_printf("total %lu\n", block_size(ls)) : 0;
	while (ls)
	{
		(flags & F_I) ? print_str(len2, 1, NULL, ls->stat->st_ino) : 0;
		(flags & F_S) ? print_str(len, 1, NULL, ls->stat->st_blocks / 2) : 0;
		(flags & F_BG) ? ft_printf("%s%s%s", ls->color, ls->name, C_NO)
			: ft_putstr(ls->name);
		(flags & F_P || flags & F_BF) ? print_fp_option(ls, flags)
			: ft_putchar('\n');
		ls = ls->next;
	}
	return (1);
}
