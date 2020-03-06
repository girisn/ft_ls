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

t_ls	*sort_no_flag(t_ls *tmp1, t_ls *tmp2, int *flag, int f)
{
	(void)f;
	if (ft_strcmp(tmp1->name, tmp2->name) > 0)
	{
		ft_swap_str(&(tmp1->name), &(tmp2->name));
		*flag = 1;
	}
	return (tmp1);
}

t_ls	*sort_r_flag(t_ls *tmp1, t_ls *tmp2, int *flag, int f)
{
	(void)f;
	if (ft_strcmp(tmp1->name, tmp2->name) < 0)
	{
		ft_swap_str(&(tmp1->name), &(tmp2->name));
		*flag = 1;
	}
	return (tmp1);
}

t_ls	*sort_t_flag(t_ls *tmp1, t_ls *tmp2, int *flag, int f)
{
	time_t		time1;
	time_t		time2;

	time1 = tmp1->stat->st_mtime;
	time2 = tmp2->stat->st_mtime;
	if ((time1 < time2 && f == 0) || (time1 > time2 && f == 1))
	{
		ft_swap_str(&(tmp1->name), &(tmp2->name));
		*flag = 1;
	}
	return (tmp1);
}

t_ls	*sorting(t_ls *ls, int a, t_ls *f(t_ls*, t_ls*, int*, int))
{
	t_ls	*tmp;
	int		flag;

// можно подать через аргументы имена файлов, которых не существует. в структуре ft_ls это листы с name=NULL
// нужно придумать, как при сортировке не проходить по файлам с name = NULL - подать второй tmp

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
		//	tmp = f(tmp, &flag, a);
			tmp = tmp->next;
		}
	}
	return (ls);
}

t_ls	*ls_sorting(t_ls *ls, int flag)
{
	if (!(flag & F_R))
		ls = sorting(ls, 0, sort_no_flag);
	else if (flag & F_R)
		ls = sorting(ls, 0, sort_r_flag);
	if (flag & F_T && !(flag & F_R))
		ls = sorting(ls, 0, sort_t_flag);
	else if (flag & F_T && flag & F_R)
		ls = sorting(ls, 1, sort_t_flag);
	return (ls);
}
