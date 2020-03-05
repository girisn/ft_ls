/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strstr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/10 20:06:58 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:57:01 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	check(int j, const char *str, const char *to_find)
{
	int i;
	int a;

	a = 0;
	i = 0;
	if (to_find[i] == str[j])
		while (to_find[i])
		{
			if (to_find[i] != str[j + i])
				return (0);
			else
			{
				a = 1;
				i++;
			}
		}
	return (a);
}

char		*ft_strstr(const char *str, const char *to_find)
{
	int i;

	i = 0;
	if (ft_strlen(to_find) == 0)
		return ((char*)str);
	while (str[i])
	{
		if (check(i, str, to_find) == 1)
			return ((char*)(str + i));
		i++;
	}
	return (NULL);
}
