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

int			ls_maxlen(t_ls *ls, int *n, t_winsize *ws, int flags)
{
	int		max;
	int		tmp;
	t_dot	len;

	max = 0;
	tmp = 0;
	len.x = 0;
	len.y = 0;
	while (ls)
	{
		if ((tmp = ft_strlen(ls->name)) > max)
			max = tmp;
		if (flags & F_S && len.x < (tmp = ft_numlen(ls->stat->st_blocks / 2)))
			len.x = tmp;
		else if (flags & F_I && len.y < (tmp = ft_numlen(ls->stat->st_ino)))
			len.y = tmp;
		(*n)++;
		ls = ls->next;
	}
	tmp = ws->ws_col / max;
	max += 2;
	max += len.x + len.y;
	(len.x) ? max += 1 : 0;
	(len.y) ? max += 1 : 0;
	return (max);
}

void		print_table_helper(t_ls *ls, int flags, int space, t_dot l)
{
	(flags & F_I) ? print_str(l.y, 1, NULL, ls->stat->st_ino) : 0;
	(flags & F_S) ?
		print_str(l.x, 1, NULL, ls->stat->st_blocks / 2) : 0;
	(flags & F_BG) ? ft_putstr(ls->color) : 0;
	print_str(space, 3, ls->name, 0);
	(flags & F_BG) ? ft_putstr(C_NO) : 0;
}

void		print_table_basic(t_ls *ls, t_dot opt, int flags, int m)
{
	t_dot	i;
	int		row;
	t_ls	*tmp;
	t_dot	l;

	i.x = opt.y;
	l.x = (flags & F_S) ? ft_intblock_size(ls, 0) : 0;
	l.y = (flags & F_I) ? ft_intblock_size(ls, 1) : 0;
	while (ls && i.x--)
	{
		i.y = -1;
		tmp = ls->next;
		while (ls && ++i.y < opt.x)
		{
			print_table_helper(ls, flags, (i.y == opt.x - 1)
				? 0 : m - l.x - l.y, l);
			row = opt.y;
			while (ls && row--)
				ls = ls->next;
		}
		ft_putchar('\n');
		ls = tmp;
	}
}

int			print_basic(t_ls *ls, int flags)
{
	int				num;
	struct winsize	*ws;
	t_dot			opt;
	int				max;

	ws = NULL;
	num = 0;
	(flags & F_S) ? ft_printf("total %lu\n", block_size(ls)) : 0;
	if (!(ws = (struct winsize*)malloc(sizeof(struct winsize))))
		ls_error("malloc", -1);
	if ((ioctl(0, TIOCGWINSZ, ws)) == -1)
		ls_error("ioctl", -1);
	opt.x = ls_maxlen(ls, &num, ws, flags);
	max = opt.x;
	if (opt.x == 0 || num == 0)
		return (1);
	opt.x = ws->ws_col / opt.x;
	(opt.x == 0) ? opt.x = 1 : 0;
	opt.y = num / opt.x + (num % opt.x ? 1 : 0);
	opt.x = num / opt.y + (num % opt.y ? 1 : 0);
	print_table_basic(ls, opt, flags, max);
	if (ws)
		free(ws);
	return (1);
}
