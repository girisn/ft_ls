#include "ft_ls.h"

int		ls_maxlen(t_ls *ls, int *av, int *n)
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
			ft_printf("%s\n", ls->name);
			ls = ls->next;
		}
/*	else
	{
		max_len = ls_maxlen(ls, &av, &num);
		ioctl(0, TIOCGWINSZ, ws);
		ft_printf("col = %d, row = %d, len = %d, num = %d\n", ws->ws_col, ws->ws_row, max_len, num);
	}*/
	return (1);
}
