/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchri.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/24 12:47:42 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:55:57 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int		ft_strchri(char *str, char c)
{
	int		i;

	i = -1;
	if (!str)
		return (-1);
	if (c == 0)
		return (ft_strlen(str));
	while (str[++i])
		if (str[i] == c)
			return (i);
	return (-1);
}
