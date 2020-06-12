/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_flags.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int		set_options(char *str, int *flags)
{
	int		n;
	int		i;

	i = 0;
	if (str[0] == '-' && str[1] == '-' && !str[2])
		return (1);
	while (str[++i])
	{
		if ((n = ft_strchri("alRrt1", str[i])) == -1)
			ls_error(str + i, 3);
		*flags |= (1 << n);
	}
	return (1);
}

int		set_flags(int argc, char **argv, int *flags)
{
	int		i;

	i = 0;
	*flags = 0;
	while (++i < argc && argv[i][0] == '-' && argv[i][1])
	{
		if (!set_options(argv[i], flags))
			return (-1);
	}
	return (i);
}