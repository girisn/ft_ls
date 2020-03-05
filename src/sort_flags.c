/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sort_flags.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/05 18:32:30 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

t_ls	*sort_no_flag(t_ls *tmp, int *flag, int f)
{
	(void)f;
	if (ft_strcmp(tmp->name, tmp->next->name) > 0)
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sort_r_flag(t_ls *tmp, int *flag, int f)
{
	(void)f;
	if (ft_strcmp(tmp->name, tmp->next->name) < 0)
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		*flag = 1;
	}
	return (tmp);
}

t_ls	*sort_t_flag(t_ls *tmp, int *flag, int f)
{
	struct stat *s;
	time_t		time1;
	time_t		time2;

	s = (struct stat*)malloc(sizeof(struct stat*));
	if (stat(tmp->name, s) == -1)
		error(NULL);
	time1 = s->st_mtime;
	if (stat(tmp->next->name, s) == -1)
		error(NULL);
	time2 = s->st_mtime;
	if ((time1 < time2 && f == 0) || (time1 > time2 && f == 1))
	{
		ft_swap_str(&(tmp->name), &(tmp->next->name));
		*flag = 1;
	}
	free(s);
	return (tmp);
}
