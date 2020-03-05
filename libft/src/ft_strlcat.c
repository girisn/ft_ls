/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/05 12:34:37 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:56:23 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcat(char *dst, const char *src, size_t size)
{
	unsigned long	i;
	unsigned long	j;
	unsigned long	s;

	i = 0;
	j = 0;
	s = size;
	if (size == 0)
		return (ft_strlen(src));
	while (dst[i] && s-- != 0)
		i++;
	if (s == 0)
		return (i + ft_strlen(src));
	s = i;
	while (dst[i])
		i++;
	while (i < size - 1 && src[j])
		dst[i++] = src[j++];
	dst[i] = '\0';
	return (s + ft_strlen(src));
}
