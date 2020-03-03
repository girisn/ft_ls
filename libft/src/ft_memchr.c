/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/17 15:34:21 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:55:14 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memchr(const void *s, int c, size_t n)
{
	unsigned long	i;
	unsigned char	*str;
	int				flag;

	str = (unsigned char*)s;
	i = 0;
	flag = 0;
	while (i < n && flag == 0)
	{
		if (str[i] == (unsigned char)c)
			flag = 1;
		i++;
	}
	if (flag == 1)
		return ((char*)(str + i - 1));
	else
		return (NULL);
}
