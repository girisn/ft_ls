/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/17 17:11:16 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:56:49 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_check(size_t j, size_t len, const char *str, const char *to_find)
{
	size_t	i;

	i = 0;
	if (to_find[i] == str[j] && str[j + i])
		while (to_find[i] && i + j < len)
		{
			if (to_find[i] != str[j + i])
				return (0);
			i++;
		}
	if (to_find[i] == '\0')
		return (1);
	else
		return (0);
}

char		*ft_strnstr(const char *haystack, const char *needle, size_t len)
{
	unsigned long	i;

	i = 0;
	if (ft_strlen(needle) == 0)
		return ((char*)haystack);
	while (i < len && haystack[i])
	{
		if (ft_check(i, len, haystack, needle) == 1)
			return ((char*)(haystack + i));
		i++;
	}
	return (NULL);
}
