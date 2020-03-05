/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ls.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 14:40:49 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/05 18:47:11 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

void	error(char *str)
{
	ft_printf("ft_ls");
	perror(str);
	exit(1);
}

int		check_flags(char *str, int flags)
{
	int		i;

	i = 0;
	while (str[++i])
		if (str[i] == 'R')
			(!(flags & F_BR)) ? flags |= F_BR : 0;
		else if (str[i] == 'l')
			(!(flags & F_L)) ? flags |= F_L : 0;
		else if (str[i] == 'a')
			(!(flags & F_A)) ? flags |= F_A : 0;
		else if (str[i] == 'r')
			(!(flags & F_R)) ? flags |= F_R : 0;
		else if (str[i] == 't')
			(!(flags & F_T)) ? flags |= F_T : 0;
		else
			return (ft_printf("usage: ./ft_ls [-Ralrt] [file ...]\n"));
	return (flags);
}

t_ls	*list_ls_init(t_ls *t, char *name)
{
	if (t == NULL)
	{
		if (!(t = (t_ls*)malloc(sizeof(t_ls))))
			error(NULL);
	}
	else
	{
		if (!(t->next = (t_ls*)malloc(sizeof(t_ls))))
			error(NULL);
		t = t->next;
	}
	ft_bzero(t, sizeof(t));
	t->name = name;
	t->next = NULL;
	return (t);
}

int		check_input(int argc, char **argv, t_ls **files)
{
	int		i;
	int		flags;
	t_ls	*tmp;

	i = 0;
	flags = 0;
	tmp = NULL;
	while (++i < argc)
	{
		if (argv[i][0] == '-')
			flags = check_flags(argv[i], flags);
		else if (tmp == NULL)
		{
			flags |= (!(flags & F_FILE)) ? F_FILE : 0;
			tmp = list_ls_init(tmp, argv[i]);
			*files = tmp;
		}
		else
			tmp = list_ls_init(tmp, argv[i]);
	}
	return (flags);
}

t_ls	*init_dir(DIR *dir)
{
	struct dirent	*d;
	t_ls			*tmp;
	t_ls			*ls;

	tmp = NULL;
	d = readdir(dir);
	while (d != NULL)
	{
		if (tmp == NULL)
		{
			tmp = list_ls_init(tmp, d->d_name);
			ls = tmp;
		}
		else
			tmp = list_ls_init(tmp, d->d_name);
		d = readdir(dir);
	}
	return (ls);
}

t_ls	*sorting(t_ls *ls, int a, t_ls *f(t_ls*, int*, int))
{
	t_ls	*tmp;
	int		flag;

	tmp = ls;
	flag = 1;
	if (tmp->next == NULL)
		return (ls);
	while (flag == 1)
	{
		flag = 0;
		tmp = ls;
		while (tmp->next != NULL)
		{
			tmp = f(tmp, &flag, a);
			tmp = tmp->next;
		}
	}
	return (ls);
}

t_ls	*ls_sorting(t_ls *ls, int flag)
{
	if (!(flag & F_R))
		ls = sorting(ls, 0, sort_no_flag);
	else if (flag & F_R)
		ls = sorting(ls, 0, sort_r_flag);
	if (flag & F_T && !(flag & F_R))
		ls = sorting(ls, 0, sort_t_flag);
	else if (flag & F_T && flag & F_R)
		ls = sorting(ls, 1, sort_t_flag);
	return (ls);
}

void	ls_print_name(t_ls *tmp)
{
	struct stat		*s;

	s = (struct stat*)malloc(sizeof(struct stat));
	stat(tmp->name, s);
	ft_printf("%11s %d %s  %", s->st_mode);
}

void	ls_output(t_ls *ls, int flag)
{
	t_ls	*tmp;

	tmp = ls;
	ls = ls_sorting(ls, flag);
	while (1)
	{
		if (tmp->name[0] == '.' && flag & F_A)
			ft_printf("%s\n", tmp->name);
		else if (tmp->name[0] != '.')
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
		error(": .");
	flag = check_input(argc, argv, &ls);
	(!(flag & F_FILE)) ? ls = init_dir(dir) : 0;
	tmp = ls;
	ls_output(ls, flag);
	exit(0);
}
