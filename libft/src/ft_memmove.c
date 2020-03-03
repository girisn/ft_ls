/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/10 22:58:49 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:55:24 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dst, const void *src, size_t len)
{
	char		*s1;
	const char	*s2;
	size_t		i;

	s1 = (char*)dst;
	s2 = (const char*)src;
	i = 0;
	if (s1 < s2)
	{
		while (i < len)
		{
			ft_memset(&s1[i], s2[i], 1);
			i++;
		}
	}
	else
	{
		while (i < len)
		{
			ft_memset(&s1[len - i - 1], s2[len - i - 1], 1);
			i++;
		}
	}
	return (s1);
}
