/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/11 13:04:37 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:57:06 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strtrim(char const *s)
{
	int		i;
	int		j;
	int		max;
	char	*str;

	if (!s)
		return (NULL);
	i = 0;
	j = 0;
	if ((max = ft_strlen(s)) > 0)
		max--;
	while (s[max] == ' ' || s[max] == '\n' || s[max] == '\t')
		max = ft_strlen(s) - ++j;
	j = 0;
	while ((s[j] == ' ' || s[j] == '\n' || s[j] == '\t') && j < max)
		j++;
	if ((str = (char*)malloc(sizeof(char) * (max - j + 2))))
	{
		while (j <= max)
			str[i++] = s[j++];
		str[i] = '\0';
		return (str);
	}
	else
		return (NULL);
}
