/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sort_check_dots.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int		ft_is_other(char c1, char c2)
{
	if (c1 == '\0' || c2 == '\0')
		return (0);
	if (!(ft_isalpha(c1) && ft_isalpha(c2)) &&
		!(ft_issimb(c1) && ft_issimb(c2)) &&
		!(ft_isdigit(c1) && ft_isdigit(c2)))
		return (1);
	return (0);
}

int		ft_strcmp_abc_return(char *s1, char *s2, int m, int i)
{
	if ((!ft_is_other(s1[i], s2[i]) && s1[i] - s2[i] > 0)
		|| (s1[i] == s2[i] && m > 0))
		return (1);
	else if ((!ft_is_other(s1[i], s2[i]) && s1[i] - s2[i] < 0)
		|| (s1[i] == s2[i] && m < 0))
		return (-1);
	else if (ft_is_other(s1[i], s2[i]))
	{
		if ((ft_isalpha(s1[i]) && (ft_isdigit(s2[i])
			|| ft_issimb(s2[i]))) ||
			(ft_isdigit(s1[i]) && ft_issimb(s2[i])))
			return (1);
		else
			return (-1);
	}
	return (0);
}

int		ft_strcmp_abc_helper(char c1, char c2, int n)
{
	if ((c1 >= 'A' && c1 <= 'Z' && c2 >= 'a' && c2 <= 'z'
		&& c1 - c2 > -32 && c1 - c2 <= -7) ||
		(c1 == '.' && c2 == '_'))
		return (1);
	else if ((c1 >= 'a' && c1 <= 'z' && c2 >= 'A' && c2 <= 'Z'
		&& c1 - c2 < 32 && c1 - c2 >= 7) ||
		(n == 1 && c1 - c2 == 32) || (c1 == '_' && c2 == '.'))
		return (-1);
	return (0);
}

int		ft_strcmp_abc(char *s1, char *s2, int n, int m)
{
	int		i;
	int		tmp;

	i = 0;
	while (s1[i] && s2[i] && (s1[i] == s2[i] || (!ft_is_other(s1[i], s2[i]) &&
		(s1[i] - s2[i] == 32 || s2[i] - s1[i] == 32))))
	{
		if ((s1[i] - s2[i] == 32 || s1[i] - s2[i] == -32) && m == 0)
			m = (s1[i] - s2[i] == 32) ? -1 : 1;
		i++;
	}
	if ((tmp = ft_strcmp_abc_helper(s1[i], s2[i], n)))
		return (tmp);
	if ((s1[i] == '.' || s1[i] == '-' || s1[i] == '_') && ft_isalnum(s2[i]))
		return (ft_strcmp_abc(s1 + i + 1, s2 + i, n, (m == 0) ? 1 : 0));
	if (ft_isalnum(s1[i]) && (s2[i] == '.' || s2[i] == '-' || s2[i] == '_'))
		return (ft_strcmp_abc(s1 + i, s2 + i + 1, n, (m == 0) ? -1 : 0));
	if ((s1[i] == '.' || s1[i] == '-' || s1[i] == '_')
		&& (s2[i] == '.' || s2[i] == '-' || s2[i] == '_'))
	{
		if (m == 0)
			m = (s1[i] > s2[i]) ? 1 : -1;
		return (ft_strcmp_abc(s1 + i + 1, s2 + i + 1, n, m));
	}
	return (ft_strcmp_abc_return(s1, s2, m, i));
}

int		check_dots(char *s1, char *s2)
{
	int		i;
	int		j;
	int		n;

	i = 0;
	j = 0;
	if (s1[0] != '.' && s2[0] != '.')
		return (ft_strcmp_abc(s1, s2, 0, 0));
	if (!ft_strcmp(s1, ".") && !ft_strcmp(s2, ".."))
		return (-1);
	if (!ft_strcmp(s2, ".") && !ft_strcmp(s1, ".."))
		return (1);
	while (s1[i] == '.')
		i++;
	while (s2[j] == '.')
		j++;
	if ((s1[0] == '.' && s2[0] != '.') || (s1[0] != '.' && s2[0] == '.'))
		n = ft_strcmp_abc(s1 + i, s2 + j, 1, 0);
	else
		n = ft_strcmp_abc(s1 + i, s2 + j, 0, 0);
	if (n)
		return (n);
	else if (i == j)
		return (0);
	return ((i > j) ? 1 : -1);
}
