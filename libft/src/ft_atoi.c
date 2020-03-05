/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/10 20:41:07 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:54:26 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int				space(const char *str)
{
	int a;

	a = 0;
	if (*str == '\n' || *str == '\t' || *str == '\v' || *str == '\f')
		a = 1;
	else if (*str == '\r' || *str == ' ' || *str == '0')
		a = 1;
	return (a);
}

static long long int	ft_return(long long int atoi, int a, int pm)
{
	if (a != 1)
		return (0);
	if (atoi >= 9223372036854775807 && pm == 1)
		return (-1);
	else if (atoi > 9223372036854775807 && pm == -1)
		return (0);
	return (atoi * pm);
}

long long int			ft_atoi(const char *str)
{
	int					pm;
	long long int		atoi;
	int					a;

	pm = 1;
	atoi = 0;
	a = 0;
	while (space(str) == 1)
		str++;
	if (*str == '-')
	{
		pm = -1;
		str++;
	}
	else if (*str == '+')
		str++;
	while (*str <= '9' && *str >= '0')
	{
		atoi = atoi * 10 + *str - '0';
		str++;
		a = 1;
	}
	return (ft_return(atoi, a, pm));
}
