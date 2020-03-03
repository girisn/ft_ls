/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/10 19:58:29 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:56:53 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{
	int i;
	int	nb;

	i = 0;
	nb = -1;
	if (c == '\0')
		return ((char*)(s + ft_strlen(s)));
	while (s[i])
	{
		if (s[i] == (unsigned char)c)
			nb = i;
		i++;
	}
	if (nb != -1)
		return ((char*)(s + nb));
	else
		return (NULL);
}
