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

t_ls	*sort_no_flag(t_ls *tmp, int flags, int *flag, int f)
{
	t_stat	*s;

	(void)f;
	s = tmp->stat;
	if (check_dots(tmp->name, tmp->next->name) > 0)
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		ft_swap_str(&(tmp->path), &(tmp->next->path));
		ft_swap_str(&(tmp->color), &(tmp->next->color));
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sort_r_flag(t_ls *tmp, int flags, int *flag, int f)
{
	t_stat	*s;

	(void)f;
	s = tmp->stat;
	if (check_dots(tmp->name, tmp->next->name) < 0)
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		ft_swap_str(&(tmp->path), &(tmp->next->path));
		ft_swap_str(&(tmp->color), &(tmp->next->color));
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sort_s_flag(t_ls *tmp, int flags, int *flag, int f)
{
	t_stat	*s;

	s = tmp->stat;
	if ((f == 0 && tmp->stat->st_size < tmp->next->stat->st_size)
		|| (f == 1 && tmp->stat->st_size > tmp->next->stat->st_size)
		|| (tmp->stat->st_size == tmp->next->stat->st_size &&
		((f == 0 && check_dots(tmp->name, tmp->next->name) > 0) ||
		(f == 1 && check_dots(tmp->name, tmp->next->name) < 0))))
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		ft_swap_str(&(tmp->path), &(tmp->next->path));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		ft_swap_str(&(tmp->color), &(tmp->next->color));
		*flag = 1;
	}
	return (tmp);
}


t_ls	*sort_t_flag(t_ls *tmp, int flags, int *flag, int f)
{
	time_t		time1;
	time_t		time2;
	t_stat		*s;
	unsigned long long int		t1;
	unsigned long long int		t2;

	s = tmp->stat;
	time1 = (flags & F_U) ? tmp->stat->st_atime : tmp->stat->st_mtime;
	(flags & F_C) ? time1 = tmp->stat->st_ctime : 0;
	time2 = (flags & F_U) ? tmp->next->stat->st_atime : tmp->next->stat->st_mtime;
	(flags & F_C) ? time2 = tmp->next->stat->st_ctime : 0;
	t1 = (flags & F_U) ? tmp->stat->st_atim.tv_nsec : tmp->stat->st_mtim.tv_nsec;
	(flags & F_C) ? t1 = tmp->stat->st_ctim.tv_nsec : 0;
	t2 = (flags & F_U) ? tmp->next->stat->st_atim.tv_nsec : tmp->next->stat->st_mtim.tv_nsec;
	(flags & F_C) ? t2 = tmp->next->stat->st_ctim.tv_nsec : 0;
	if (((time1 < time2 && f == 0) || (time1 > time2 && f == 1)) ||
		(time1 == time2 && t1 > t2 && f == 1) || (time1 == time2 && t1 < t2 && f == 0)
		|| (time1 == time2 && t1 == t2 &&
		((f == 0 && check_dots(tmp->name, tmp->next->name) > 0)
		|| (f == 1 && check_dots(tmp->name, tmp->next->name) < 0))))
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		ft_swap_str(&(tmp->color), &(tmp->next->color));
		ft_swap_str(&(tmp->path), &(tmp->next->path));
		*flag = 1;
	}
	return (tmp);
}

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
