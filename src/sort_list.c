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

int		ft_strcmp_abc(char *s1, char *s2, int n)
{
	int		i;

	i = 0;
	while (s1[i] && s2[i] && s1[i] == s2[i])
		i++;
	if (s1[i] >= 'A' && s1[i] <= 'Z' && s2[i] >= 'a' && s2[i] <= 'z'
		&& s1[i] - s2[i] > -32 && s1[i] - s2[i] <= -7)
		return (1);
	else if (s1[i] >= 'a' && s1[i] <= 'z' && s2[i] >= 'A' && s2[i] <= 'Z'
		&& s1[i] - s2[i] < 32 && s1[i] - s2[i] >= 7)
		return (-1);
	else if (s1[i] > s2[i])
		return (1);
	else if (s1[i] == s2[i])
		return (0);
	return (-1);
}

t_ls	*sort_no_flag(t_ls *tmp, int *flag, int f)
{
	t_stat	*s;
	char	*p;

	(void)f;
	s = tmp->stat;
	p = tmp->path;
	if (ft_strcmp_abc(tmp->name, tmp->next->name, 0) > 0)
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		tmp->path = tmp->next->path;
		tmp->next->path = p;
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sort_r_flag(t_ls *tmp, int *flag, int f)
{
	t_stat	*s;
	char	*p;

	(void)f;
	s = tmp->stat;
	p = tmp->path;
	if (ft_strcmp_abc(tmp->name, tmp->next->name, 1) < 0)
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		tmp->path = tmp->next->path;
		tmp->next->path = p;
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sort_t_flag(t_ls *tmp, int *flag, int f)
{
	time_t		time1;
	time_t		time2;
	t_stat		*s;
	char		*p;

	s = tmp->stat;
	p = tmp->path;
	time1 = tmp->stat->st_mtime;
	time2 = tmp->next->stat->st_mtime;
	if (((time1 < time2 && f == 0) || (time1 > time2 && f == 1)) ||
		(time1 == time2 &&
		(((f == 0 && ft_strcmp_abc(tmp->name, tmp->next->name, 0) > 0))
		|| (f == 1 && ft_strcmp_abc(tmp->name, tmp->next->name, 1) < 0))))
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		tmp->stat = tmp->next->stat;
		tmp->next->stat = s;
		tmp->path = tmp->next->path;
		tmp->next->path = p;
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sorting(t_ls *ls, int a, t_ls *f(t_ls*, int*, int))
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
			tmp = f(tmp, &flag, a);
			tmp = tmp->next;
		}
	}
	return (ls);
}

t_ls	*sort_list(t_ls *ls, int flag)
{
	if (!(flag & F_R) && !(flag & F_T))
		ls = sorting(ls, 0, sort_no_flag);
	else if (flag & F_R && !(flag & F_T))
		ls = sorting(ls, 0, sort_r_flag);
	else if (flag & F_T && !(flag & F_R))
		ls = sorting(ls, 0, sort_t_flag);
	else if (flag & F_T && flag & F_R)
		ls = sorting(ls, 1, sort_t_flag);
	return (ls);
}
