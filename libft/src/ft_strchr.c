/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/05 13:35:23 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:55:53 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strchr(const char *s, int c)
{
	int flag;
	int i;

	flag = 0;
	i = 0;
	if (c == '\0')
		return ((char*)(s + ft_strlen(s)));
	while (s[i] && flag == 0)
	{
		if (s[i] == (unsigned char)c)
			flag = 1;
		i++;
	}
	if (flag == 1)
		return ((char*)(s + i - 1));
	else
		return (NULL);
}
