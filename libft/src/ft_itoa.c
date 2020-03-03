/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/23 17:54:21 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:54:46 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_len(int n)
{
	int i;
	int nb;

	i = 0;
	nb = n;
	if (nb < 0 || n == 0)
		i++;
	while (nb != 0)
	{
		nb = nb / 10;
		i++;
	}
	return (i);
}

static int	ft_abs(int n)
{
	if (n == -2147483648)
		return (8);
	else if (n > 0)
		return (n % 10);
	else if (n < 0)
		return ((-n) % 10);
	else
		return (n);
}

char		*ft_itoa(int n)
{
	char	*str;
	int		len;
	int		i;

	i = 0;
	len = ft_len(n);
	if (!(str = (char*)malloc(sizeof(char) * (len + 1))))
		return (NULL);
	while (str[i])
		str[i++] = '0';
	str[len] = '\0';
	if (n == 0)
		str[(len--) - 1] = '0';
	while (n != 0)
	{
		str[len - 1] = ft_abs(n) + '0';
		n = n / 10;
		len--;
	}
	if (len > 0)
		str[0] = '-';
	return (str);
}
