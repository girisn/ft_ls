/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pf_numbers_float.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/25 16:58:45 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:58:51 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	ft_in(t_printf *p, long double nb)
{
	int			i;
	int			tmp;
	uintmax_t	tmp2;

	i = -1;
	nb = nb - (long int)nb;
	tmp = (int)(nb * 10) % 10;
	while (++i < p->pres + 1)
		nb *= 10;
	p->im = nb;
	(!p->pres && p->im % 10 > 4) ? p->re++ : 0;
	if (p->im % 10 > 4)
	{
		p->im /= 10;
		p->im += 1;
	}
	else
		p->im /= 10;
	tmp2 = p->im;
	while (--i > 1)
		tmp2 /= 10;
	(tmp == 9 && tmp2 == 10) ? p->re++ : 0;
}

void	check_length_float(t_printf *p, long double nb)
{
	intmax_t	tmp;

	tmp = (p->re < 0) ? -p->re : p->re;
	(p->re == 0) ? p->nlen++ : 0;
	while (tmp > 0)
	{
		tmp /= 10;
		p->nlen++;
	}
	p->sign = (nb < 0 || p->f & F_PLUS || p->f & F_SPACE) ? 1 : 0;
	if (p->f & F_NULL)
	{
		(p->sign && p->f & F_SPACE && nb > 0) ? buffer(p, " ", 1) : 0;
		(p->sign && p->f & F_PLUS && nb > 0) ? buffer(p, "+", 1) : 0;
		(p->sign && nb < 0) ? buffer(p, "-", 1) : 0;
	}
	p->padding = p->width - p->nlen - p->pres - p->sign;
	(p->sign && !(p->f & F_NULL)) ? p->nlen++ : 0;
	if (!(p->f & F_MINUS))
		(p->f & F_NULL) ? padding(p, '0') : padding(p, ' ');
	(p->f & F_NULL && p->sign) ? p->sign = 0 : 0;
}

void	ft_itoa_print_float(t_printf *p, long double nb)
{
	int			i;
	intmax_t	tmp;
	char		str[p->nlen + p->pres];

	i = p->nlen + p->pres - 1;
	tmp = (p->re < 0) ? -p->re : p->re;
	while (i > p->nlen - 1)
	{
		str[i--] = p->im % 10 + '0';
		p->im /= 10;
	}
	(p->pres || p->f & F_GRID) ? str[i--] = '.' : 0;
	while (i >= p->sign)
	{
		str[i--] = tmp % 10 + '0';
		tmp /= 10;
	}
	(p->sign && p->f & F_SPACE && !(p->f & F_NULL)) ? str[0] = ' ' : 0;
	(p->sign && p->f & F_PLUS && !(p->f & F_NULL)) ? str[0] = '+' : 0;
	(p->sign && nb < 0 && !(p->f & F_NULL)) ? str[0] = '-' : 0;
	buffer(p, str, p->nlen + p->pres);
	(p->f & F_MINUS) ? padding(p, ' ') : 0;
}

void	pf_type_float(t_printf *p)
{
	long double		nb;
	double			tmp;

	p->nlen = 0;
	p->re = 0;
	p->im = 0;
	if (p->float_max)
		nb = (long double)va_arg(p->ap, long double);
	else
		nb = (long double)va_arg(p->ap, double);
	tmp = (nb < 0) ? -nb : nb;
	p->re = tmp;
	(!(p->f & F_PRES)) ? p->pres = 6 : 0;
	ft_in(p, tmp);
	(!p->pres && !(p->f & F_GRID)) ? p->pres = 0 : p->nlen++;
	(nb < 0) ? p->re = -p->re : 0;
	check_length_float(p, nb);
	ft_itoa_print_float(p, nb);
}
