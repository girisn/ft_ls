/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strncpy.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/05 11:45:18 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:56:40 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strncpy(char *dst, const char *src, size_t len)
{
	unsigned long	i;
	unsigned long	j;

	i = 0;
	j = 0;
	while (src[j])
		j++;
	while (i < len)
	{
		if (i < j)
		{
			dst[i] = src[i];
			i++;
		}
		else
		{
			dst[i] = '\0';
			i++;
		}
	}
	return (dst);
}
