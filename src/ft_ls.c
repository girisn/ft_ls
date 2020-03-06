/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ls.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 14:40:49 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:02:28 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

void	error(char *str)
{
	ft_printf("ft_ls: ");
	perror(str);
}

void	ls_output(t_ls *ls, int flag)
{
	t_ls	*tmp;

	tmp = ls;
//	ls = ls_sorting(ls, flag);
	while (1)
	{
		if (tmp->name != NULL && ((tmp->name[0] == '.' && flag & F_A)
			|| tmp->name[0] != '.'))
			ft_printf("%s\n", tmp->name);
		if (tmp->next == NULL)
			break ;
		tmp = tmp->next;
	}
}

int		main(int argc, char **argv)
{
	int		flag;
	t_ls	*ls;
	DIR		*dir;
	t_ls	*tmp;

	ls = NULL;
	if ((dir = opendir(".")) == NULL)
		error(".");
	flag = (argc > 1) ? check_input(argc, argv, &ls) : 0;
	(!(flag & F_FILE)) ? ls = init_dir(dir) : 0;
	ls_output(ls, flag);
	if ((closedir(dir)) == -1)
		error(NULL);
	exit(0);
}
