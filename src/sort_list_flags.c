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
	(void)flags;
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
	(void)flags;
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

	(void)flags;
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

time_t	sort_t_flag_helper(t_ls *tmp, int flags,
			unsigned long long int *t, int n)
{
	time_t	time;

	if (n == 0)
	{
		time = (flags & F_U) ? tmp->stat->st_atime : tmp->stat->st_mtime;
		(flags & F_C) ? time = tmp->stat->st_ctime : 0;
		*t = (flags & F_U) ? tmp->stat->st_atim.tv_nsec
			: tmp->stat->st_mtim.tv_nsec;
		(flags & F_C) ? *t = tmp->stat->st_ctim.tv_nsec : 0;
	}
	else
	{
		time = (flags & F_U) ? tmp->next->stat->st_atime
			: tmp->next->stat->st_mtime;
		(flags & F_C) ? time = tmp->next->stat->st_ctime : 0;
		*t = (flags & F_U) ? tmp->next->stat->st_atim.tv_nsec
			: tmp->next->stat->st_mtim.tv_nsec;
		(flags & F_C) ? *t = tmp->next->stat->st_ctim.tv_nsec : 0;
	}
	return (time);
}

t_ls	*sort_t_flag(t_ls *tmp, int flags, int *flag, int f)
{
	time_t						time1;
	time_t						time2;
	t_stat						*s;
	unsigned long long int		t1;
	unsigned long long int		t2;

	s = tmp->stat;
	time1 = sort_t_flag_helper(tmp, flags, &t1, 0);
	time2 = sort_t_flag_helper(tmp, flags, &t2, 1);
	if (((time1 < time2 && f == 0) || (time1 > time2 && f == 1)) ||
		(time1 == time2 && t1 > t2 && f == 1) ||
		(time1 == time2 && t1 < t2 && f == 0) ||
		(time1 == time2 && t1 == t2 &&
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
