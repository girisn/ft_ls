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

int		ft_strcmp_abc(char *s1, char *s2, int n)
{
	int		i;
	int		dot;

	i = 0;
	while (s1[i] && s2[i] && s1[i] == s2[i])
		i++;
	if (s1[i] >= 'A' && s1[i] <= 'Z' && s2[i] >= 'a' && s2[i] <= 'z'
		&& s1[i] - s2[i] > -32 && s1[i] - s2[i] <= -7)
		return (1);
	else if (s1[i] >= 'a' && s1[i] <= 'z' && s2[i] >= 'A' && s2[i] <= 'Z'
		&& ((s1[i] - s2[i] < 32 && s1[i] - s2[i] >= 7)
		|| (n == 1 && s1[i] - s2[i] == 32)))
		return (-1);
	else if (s1[i] > s2[i])
		return (1);
	else if (s1[i] == s2[i])
		return (0);
	return (-1);
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
		return (ft_strcmp_abc(s1, s2, 0));
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
		n = ft_strcmp_abc(t1, t2, 1);
	else
		n = ft_strcmp_abc(t1, t2, 0);
	if (n > 0)
		return (1);
	else if (n < 0)
		return (-1);
	else if (i == j)
		return (0);
	else
		return ((i > j) ? 1 : -1);
}
