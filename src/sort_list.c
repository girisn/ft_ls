/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sort_flags.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

t_ls	*sorting(t_ls *ls, int flags, int a, t_ls *f(t_ls*, int, int*, int))
{
	t_ls	*tmp;
	int		flag;

	tmp = ls;
	flag = 1;
	if (tmp->next == NULL)
		return (ls);
	while (flag == 1)
	{
		flag = 0;
		tmp = ls;
		while (tmp->next != NULL)
		{
			tmp = f(tmp, flags, &flag, a);
			tmp = tmp->next;
		}
	}
	return (ls);
}

t_ls	*sort_list(t_ls *ls, int flag)
{
	if (!ls)
		return (NULL);
	if (flag & F_F)
		return (ls);
	if (!(flag & F_T) && flag & F_BS && !(flag & F_R))
		ls = sorting(ls, flag, 0, sort_s_flag);
	else if (!(flag & F_T) && flag & F_BS && flag & F_R)
		ls = sorting(ls, flag, 1, sort_s_flag);
	else if (!(flag & F_R) && !(flag & F_T))
		ls = sorting(ls, flag, 0, sort_no_flag);
	else if (flag & F_R && !(flag & F_T))
		ls = sorting(ls, flag, 0, sort_r_flag);
	else if (flag & F_T && !(flag & F_R))
		ls = sorting(ls, flag, 0, sort_t_flag);
	else if (flag & F_T && flag & F_R)
		ls = sorting(ls, flag, 1, sort_t_flag);
	return (ls);
}
