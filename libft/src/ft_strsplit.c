/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strsplit.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/20 16:26:47 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:56:56 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int		ft_yn(char str, char c)
{
	if (str == c)
		return (0);
	else if (str != c && str != '\0')
		return (1);
	else
		return (2);
}

static int		words(const char *str, char c)
{
	int i;
	int n;

	i = 0;
	n = 0;
	while (str[i])
	{
		while (ft_yn(str[i], c) == 0)
			i++;
		while (ft_yn(str[i], c) == 1)
			i++;
		n++;
	}
	return (n);
}

static int		length(const char *str, int nb, char c)
{
	int i;
	int len;
	int j;

	i = 0;
	j = 1;
	len = 0;
	while (ft_yn(str[i], c) == 0)
		i++;
	while (j < nb)
	{
		while (ft_yn(str[i], c) == 1)
			i++;
		j++;
		while (ft_yn(str[i], c) == 0)
			i++;
	}
	if (j == nb)
	{
		while (ft_yn(str[i++], c) == 1)
			len++;
	}
	return (len);
}

static char		**ft_map(char const *str, char c, char **s)
{
	int i;
	int j;
	int k;

	i = 0;
	j = 0;
	k = 0;
	while (ft_yn(str[i], c) == 0)
		i++;
	while (str[i])
	{
		k = 0;
		while (ft_yn(str[i], c) == 1)
			s[j][k++] = str[i++];
		s[j++][k] = '\0';
		while (ft_yn(str[i], c) == 0)
			i++;
	}
	s[j] = 0;
	return (s);
}

char			**ft_strsplit(char const *str, char c)
{
	char	**s;
	int		i;

	i = 1;
	if (!str)
		return (NULL);
	if ((s = (char**)malloc(sizeof(char*) * (words(str, c) + 1))) == NULL)
		return (NULL);
	while (i++ <= words(str, c))
		if (!(s[i - 2] = (char*)malloc(sizeof(char) *
						(length(str, i - 1, c) + 2))))
		{
			while (i-- > 0)
				free(s[i - 2]);
			return (NULL);
		}
	return (ft_map(str, c, s));
}
