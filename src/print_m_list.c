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

void	print_m_list_helper(t_ls *ls, int flags, int *first, t_winsize *ws)
{
	int		len;
	int		max_len;
	int		tmp;

	len = 0;
	max_len = 0;
	tmp = 0;
	len = ft_strlen(ls->name);
	tmp = max_len + len;
	(flags & F_S) ? tmp += ft_numlen(ls->stat->st_blocks / 2) + 1 : 0;
	(flags & F_I) ? tmp += ft_numlen(ls->stat->st_ino) + 1 : 0;
	if (tmp >= ws->ws_col)
		ft_putchar('\n');
	else
		(*first == 0) ? ft_putchar(' ') : (*first = 0);
	max_len = (tmp < ws->ws_col) ? max_len + len : len;
	(flags & F_I) ? ft_printf("%d ", ls->stat->st_ino) : 0;
	(flags & F_S) ? ft_printf("%d ", ls->stat->st_blocks / 2) : 0;
	(flags & F_BG) ? ft_printf("%s%s%s", ls->color, ls->name, C_NO)
		: ft_putstr(ls->name);
	if (ls->next)
		ft_putchar(',');
	max_len += (flags & F_S) ? ft_numlen(ls->stat->st_blocks / 2) + 3 : 2;
	(flags & F_I) ? max_len += ft_numlen(ls->stat->st_ino) + 1 : 0;
	(ls->next == NULL) ? ft_putchar('\n') : 0;
}

void	print_m_list(t_ls *ls, int flags)
{
	struct winsize	*ws;
	int				first;

	ws = NULL;
	first = 1;
	if (!(ws = (struct winsize*)malloc(sizeof(struct winsize))))
		ls_error("malloc", -1);
	if (ioctl(0, TIOCGWINSZ, ws))
		ls_error("ioctl", -1);
	(flags & F_S) ? ft_printf("total %lu\n", block_size(ls)) : 0;
	while (ls)
	{
		print_m_list_helper(ls, flags, &first, ws);
		ls = ls->next;
	}
	if (ws)
		free(ws);
}
