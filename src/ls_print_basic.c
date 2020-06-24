/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_print_basic.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/05 18:25:55 by btyrande          #+#    #+#             */
/*   Updated: 2020/03/06 19:03:32 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

/*int		ls_maxlen(t_ls *ls, int *av, int *n)
{
	int		max;
	int		tmp;

	max = 0;
	tmp = 0;
	*av = 0;
	*n = 0;
	while (ls)
	{
		if ((tmp = ft_strlen(ls->name)) > max)
			max = tmp;
		*av += tmp;
		(*n)++;
		ls = ls->next;
	}
	*av /= *n;
	return (max);
}*/

long int	ft_max(long int a, long int b)
{
	return (b & ((a - b) >> 31) | a & (~(a - b) >> 31));
}


//# define MAX(a, b)			b & ((a - b) >> 31) | a & (~(a - b) >> 31)
typedef struct      s_dot
{
    int         x;
    int         y;
}                   t_dot;
// список вроде всех новых и справленных
int     check_dots(char *s1, char *s2);
t_ls    *sort_list(t_ls *ls, int flag);

//int     add_new_file(char *path, char *name, t_ls **file);

int     ls_error(char *str, int n);
void    free_list(t_ls **ls);

//int     set_flags(int argc, char **argv, int *flags);

int     print_list(t_ls *ls, int args, int flags, int n);
int     print_basic(t_ls *ls, int flags);
int     print_table(t_ls *ls, int flags);

void    ls_type(t_stat *stat);
//void    ls_mode(mode_t mode);
//void    print_time(t_ls *ls);
//short unsigned  block_size(t_ls *ls);


// мне понадобилось несколько стандарных функций



static void		ft_putnchar(int len, char c) // печать len символов с подряд
{
    while (len--)
        ft_putchar (c);
}

int		int_len(int n) // длина числа
{
    int	len;

    len = 1;
    while (n / 10)
    {
        n /= 10;
        ++len;
    }
    return (len);
}



int			ls_maxlen(t_ls *ls, int *av, int *n)// самая большая длина имени в списке
// тмп - длина строки если все имена в одну строку
// ав - мреднее длина имени (как сумма, дделенная на кол-ао аргументов\имен)
{
	int		max;
	int		tmp;

	max = 0;
	tmp = 0;
	*av = 0;
	*n = 0;
	while (ls)
	{
		if ((tmp = ft_strlen(ls->name)) > max)
			max = tmp;
		*av += tmp;
		(*n)++;
		ls = ls->next;
	}

	*av /= *n;
	return (max);
}

int		lst_blocks_len(t_ls *lst, int *total) // максимальная длина ячейки
{
    int	max_len;

    max_len = 0; // максисальное длина числа ст_блока прои одном столбце
    while (lst)
    {
        max_len = ft_max(int_len(lst->stat->st_blocks),  max_len);
        *total += lst->stat->st_blocks;
        lst = lst->next;
    }
    return (max_len);
}

void		display_name(t_ls *l, int flags, int blocks_len)
{
    int		tmp_len;

    if (blocks_len)
    {
		ft_putnchar(ft_max(blocks_len - int_len(l->stat->st_blocks), 0), ' ');
        ft_printf("%d ", l->stat->st_blocks);
    }
        ft_printf("%s", l->name);
//    if (flags & LS_G)
//    {
//        if (S_ISDIR(l->stat->st_mode
//        ))
//            ft_printf("%{cyan}%s%{eoc}", l->name); // cyan = сине - зеленный  eoc - наверно конец цвета
//        else

}

int static			print_table_1(t_ls *lst, t_dot opt, t_dot max_len, int flags) //lst_column
{ // печать по строчкам
    int				tmp_column;
    int				tmp_row;
    t_ls			*lst_tmp;
    int				counter;

    // ft_printf("print_table_1\n");

    counter = opt.y;
    while (lst && counter--) // пока не закончились строчки
    {
        tmp_column = opt.x; // 
        lst_tmp = lst->next;
        while (lst && tmp_column--) // пока есть место в строке
        {
            display_name(lst, flags, max_len.y);
            if (tmp_column)
            ft_putnchar(MAX(max_len.x - ft_strlen(lst->name), 0), ' ' );
            // tmp_column = MAX(max_len.x - ft_strlen(lst->name), 0);
            // // while(tmp_colum11n--)
            // // {
            // //     ft_putchar('-');
            
            //  if (tmp_column--)
                 // ft_putnchar(MAX(max_len.x - ft_strlen(lst->name), 0), ' ');
            tmp_row = opt.y;
            while (lst && tmp_row--)
                lst = lst->next;
        }
        ft_putchar('\n'); // переход к след строке
        lst = lst_tmp;
    }
    return (1);
}




int					print_basic(t_ls *ls, int flags)
{
	int				max_len;
	int				av;
	int				num; //общее кол - во файлов
	struct winsize	*ws; //
	t_dot           len_max; // макс число строк или  столбцов при печати в одну строку илои столбец
	t_dot          opt;
	t_ls            *tmp;

	sort_list(ls, flags);
	ws = (struct winsize*)malloc(sizeof(struct winsize));

	if (flags & F_ONE) // печать в 1 столбец
		while (ls)
		{
			(flags & F_BG) ? ft_printf("%s%s%s\n", ls->color, ls->name, C_NO)
				: ft_printf("%s\n", ls->name);
			ls = ls->next;
		}
	else
	{
//		max_len = ls_maxlen(ls, &av, &num);
		len_max.x = ls_maxlen(ls, &av, &num) + 0; // !!!! +4 +1 если флаг G (без владельцкф файла)
        // len_max.y = (flags & LS_S) ? lst_blocks_len(lst, &total) : 0;;// если флаг не S - тогда один столбец и строк по кол-ву файлов
        len_max.y = 0;
        //     if (flags & LS_S)
        // ft_printf("total %d\n", total);
		ioctl(0, TIOCGWINSZ, ws);

	opt.x = ws->ws_col / (len_max.x + len_max.y);//если  не флаг_128
	opt.y =0;
	tmp = ls;
		while (tmp)
        {
           ++opt.y;
            tmp = tmp->next;
        }
		//(!(flags & 128))
	opt.y = + opt.y /opt.x; //+(opt.y %opt.x ? 1: 0) 
	print_table_1(ls,opt, len_max, flags);
	}
	return (1);
}




/*
int		print_basic(t_ls *ls, int flags)
{
//	int				max_len;
//	int				av;
//	int				num;
//	struct winsize	*ws;

	sort_list(ls, flags);
//	ws = (struct winsize*)malloc(sizeof(struct winsize));
//	if (flags & F_ONE)
		while (ls)
		{
			(flags & F_BG) ? ft_printf("%s%s%s\n", ls->color, ls->name, C_NO)
				: ft_printf("%s\n", ls->name);
			ls = ls->next;
		}*/
/*	else
	{
		max_len = ls_maxlen(ls, &av, &num);
		ioctl(0, TIOCGWINSZ, ws);
		ft_printf("col = %d, row = %d, len = %d, num = %d\n", ws->ws_col, ws->ws_row, max_len, num);
	}*/
/*	return (1);
}
*/