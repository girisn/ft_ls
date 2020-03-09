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

void	error_exit(char *str)
{
	ft_printf("ft_ls: ");
	perror(str);
	exit(1);
}

void	l_mode(struct stat *stat)
{
	if (S_ISLNK(stat->st_mode))
		ft_printf("l");
	else if (S_ISREG(stat->st_mode))
		ft_printf("-");
	else if (S_ISDIR(stat->st_mode))
		ft_printf("d");
	else if (S_ISCHR(stat->st_mode))
		ft_printf("c");
	else if (S_ISBLK(stat->st_mode))
		ft_printf("b");
	else if (S_ISFIFO(stat->st_mode))
		ft_printf("p");
//	else if (S_ISSOCK(stat->st_mode))
//		ft_printf("s");
}

void	ls_print_l(t_ls *tmp)
{
	l_mode(tmp->stat);
	// права доступа
	// количество ссылок на файл
	// имя владельца
	// имя группы
	// размер файла (в байтах)
	// временной штамп (время последней модификации)
	// имя файла
	// + учесть ширину полей
}

void	valid_file(t_ls *ls, char *name)
{
	
}

void	ls_output(t_ls *ls, int *flag)
{
	t_ls	*tmp;

	tmp = ls;
	ls = ls_sorting(ls, *flag);
	while (1)
	{
		if (tmp->name != NULL && (*flag & F_A || tmp->name[0] != '.'))
		{
			(!(*flag & F_OUT)) ? *flag |= F_OUT : 0;
			if (*flag & F_L)
				(*flag & F_FILE) ? valid_file(ls, tmp->name) : ft_printf("%s\n", tmp->name);
			else
				(*flag & F_FILE) ? valid_file(ls, tmp->name) : ft_printf("%s\n", tmp->name);
		}
		if (tmp->next == NULL)
			break ;
		tmp = tmp->next;
	}
}

void	ls_output_reverse(t_ls *ls, char *name, char *name_dir, int flag)
{
	DIR		*dir;
	t_ls	*tmp;
	char	*path;

	if ((dir = opendir(path = (make_dir_name(name, name_dir)))) == NULL)
		error_exit(name);
	(flag & F_OUT) ? ft_printf("\n") : 0;
	ft_printf("%s:\n", path);
	ls = init_dir(dir, path);
	ls_output(ls, &flag);
	tmp = ls;
	while (1)
	{
		if (S_ISDIR(tmp->stat->st_mode) && (flag & F_A || tmp->name[0] != '.'))
			ls_output_reverse(tmp->down, tmp->name, tmp->name_dir, flag);
		if (tmp->next == NULL)
			break ;
		tmp = tmp->next;
	}
	closedir(dir);
}

int		main(int argc, char **argv)
{
	int		flag;
	t_ls	*ls;
	DIR		*dir;
	t_ls	*tmp;

	ls = NULL;
	flag = (argc > 1) ? check_input(argc, argv, &ls) : 0;
	if (!(flag & F_BR))
		if ((dir = opendir(".")) == NULL)
			error_exit(NULL);
	(!(flag & F_FILE) && !(flag & F_BR)) ? ls = init_dir(dir, ".") : 0;
	(ls != NULL && !(flag & F_BR)) ? ls_output(ls, &flag) : 0;
	(flag & F_BR) ? ls_output_reverse(ls, ".", NULL, flag) : 0;
	if (!(flag & F_BR))
		if ((closedir(dir)) == -1)
			error_exit(NULL);
	exit(0);
}
