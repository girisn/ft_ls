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

int		ft_issimb(char c)
{
	if ((c >= 32 && c <= 47) || (c >= 58 && c <= 64) ||
		(c >= 91 && c <= 96) || (c >= 123 && c <= 126))
		return (1);
	return (0);
}

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

int		ft_strcmp_abc(char *s1, char *s2, int n, int m)
{
	int		i;

	i = 0;
	
	while (s1[i] && s2[i] &&
		(s1[i] == s2[i] || (!ft_is_other(s1[i], s2[i]) &&
		(s1[i] - s2[i] == 32 || s2[i] - s1[i] == 32))))
	{
		if ((s1[i] - s2[i] == 32 || s1[i] - s2[i] == -32) && m == 0)
			m = (s1[i] - s2[i] == 32) ? -1 : 1;
		i++;
	}
//	ft_printf("c1 = %c, c2 = %c\n", s1[i], s2[i]);
	if ((s1[i] >= 'A' && s1[i] <= 'Z' && s2[i] >= 'a' && s2[i] <= 'z'
		&& s1[i] - s2[i] > -32 && s1[i] - s2[i] <= -7) ||
		(s1[i] == '.' && s2[i] == '_'))
		return (1);
	else if ((s1[i] >= 'a' && s1[i] <= 'z' && s2[i] >= 'A' && s2[i] <= 'Z'
		&& s1[i] - s2[i] < 32 && s1[i] - s2[i] >= 7) ||
		(n == 1 && s1[i] - s2[i] == 32) || (s1[i] == '_' && s2[i] == '.'))
		return (-1);
	else if ((s1[i] == '.' || s1[i] == '-' || s1[i] == '_') && ft_isalnum(s2[i]))
	{
		(m == 0) ? m = 1 : 0;
		return (ft_strcmp_abc(s1 + i + 1, s2 + i, n, m));
	}
	else if (ft_isalnum(s1[i]) && (s2[i] == '.' || s2[i] == '-' || s2[i] == '_'))
	{
		(m == 0) ? m = -1 : 0;
		return (ft_strcmp_abc(s1 + i, s2 + i + 1, n, m));
	}
	else if ((s1[i] == '.' || s1[i] == '-' || s1[i] == '_')
		&& (s2[i] == '.' || s2[i] == '-' || s2[i] == '_'))
	{
		if (m == 0)
			m = (s1[i] > s2[i]) ? 1 : -1;
		return (ft_strcmp_abc(s1 + i + 1, s2 + i + 1, n, m));
	}
	if ((!ft_is_other(s1[i], s2[i]) && s1[i] - s2[i] > 0) || (s1[i] == s2[i] && m > 0))
		return (1);
	else if ((!ft_is_other(s1[i], s2[i]) && s1[i] - s2[i] < 0) || (s1[i] == s2[i] && m < 0))
		return (-1);
	else if (ft_is_other(s1[i], s2[i]))
	{
		if ((ft_isalpha(s1[i]) && (ft_isdigit(s2[i]) || ft_issimb(s2[i]))) ||
			(ft_isdigit(s1[i]) && ft_issimb(s2[i])))
			return (1);
		else
			return (-1);
	}
	return (0);
}

int		check_dots(char *s1, char *s2)
{
	int		i;
	int		j;
	int		n;
	char	*t1;
	char	*t2;

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
	t1 = s1 + i;
	while (s2[j] == '.')
		j++;
	t2 = s2 + j;
	if ((s1[0] == '.' && s2[0] != '.') || (s1[0] != '.' && s2[0] == '.'))
		n = ft_strcmp_abc(t1, t2, 1, 0);
	else
		n = ft_strcmp_abc(t1, t2, 0, 0);
	if (n > 0)
		return (1);
	else if (n < 0)
		return (-1);
	else if (i == j)
		return (0);
	else
		return ((i > j) ? 1 : -1);
}
