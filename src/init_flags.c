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

int		print_usage(void)
{
	ft_printf("Usage: ./ft_ls [OPTION] [FILES]\n");
	ft_printf("  -a\tdo not ignore entries starting with .\n");
	ft_printf("  -c\tshow ctime (time of last modification ");
	ft_printf("of file status information)\n");
	ft_printf("  -d\tlist directories themselves, not their contents\n");
	ft_printf("  -f\tdo not sort, enable -a, disable -l, -n, -o\n");
	ft_printf("  -F\tappend indicator (one of */|\n");
	ft_printf("  -G\tadd colors\n");
	ft_printf("  -i\tprint the index numbr of each file\n");
	ft_printf("  -l\tuse a long listing format\n");
	ft_printf("  -m\tfill width with a comma separated list of entries\n");
	ft_printf("  -n\tlike -l, but list numeric user and group IDs\n");
	ft_printf("  -o\tlike -l, but do not list group information\n");
	ft_printf("  -p\tappend / indicator to directories\n");
	ft_printf("  -r\treverse order while sorting\n");
	ft_printf("  -s\tprint the allocated size of each file, in blocks\n");
	ft_printf("  -S\tsort by file size, largest first (if no -t)\n");
	ft_printf("  -R\tlist subdirectories recursively\n");
	ft_printf("  -t\tsort by modification time, newest first\n");
	ft_printf("  -u\tshow atime (access time)\n");
	ft_printf("  -1\tlist one file per line\n");
	return (-1);
}

int		set_options(char *str, int *flags)
{
	int		n;
	int		i;

	i = 0;
	while (str[++i])
	{
		if ((n = ft_strchri("acdfFGilmnoprRsStu1", str[i])) == -1)
		{
			ls_error(str + i, 3);
			return (0);
		}
		if (*flags & F_L && str[i] == 'f')
			*flags &= !(F_L | F_N | F_O);
		if (str[i] == 'f')
			*flags |= F_ONE;
		if (*flags & F_L && str[i] == 'm')
			*flags & !(F_L | F_N | F_O);
		if ((str[i] == 'o' || str[i] == 'n') && !(*flags & F_L))
			*flags |= F_L;
		if (str[i] == 'f')
			*flags |= F_A;
		*flags |= (1 << n);
	}
	return (1);
}

int		set_flags(int argc, char **argv, int *flags, int *spec)
{
	int		i;
	int		n;
	int		option;

	i = 0;
	n = 0;
	*flags = 0;
	*spec = 0;
	while (++i < argc)
	{
		if (*spec == 0 && !ft_strcmp(argv[i], "--help"))
			return (print_usage());
		else if (argv[i][0] == '-' && argv[i][1] == '-' && !argv[i][2])
		{
			*spec = 1;
			return (n);
		}
		else if (argv[i][0] == '-' && argv[i][1])
		{
			if (!set_options(argv[i], flags))
				return (-1);
			n++;
		}
	}
	return (n);
}
