/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_countwords.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/10 19:31:48 by svivienn          #+#    #+#             */
/*   Updated: 2020/02/27 13:04:17 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_countwords(char const *s, char c)
{
	size_t	i;
	int		in;

	i = 0;
	in = 0;
	while (*s != '\0')
	{
		if (in == 1 && *s == c)
			in = 0;
		if (in == 0 && *s != c)
		{
			in = 1;
			i++;
		}
		s++;
	}
	return (i);
}