/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pf_numbers_signed.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/24 14:37:02 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:58:53 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	exception(t_printf *p)
{
	if (ft_strchr("di", *p->form) && (p->f & F_LONG2 || p->f & F_MAXINT ||
		p->f & F_LONG) && p->s_nb < -9223372036854775807)
	{
		p->nlen = 18;
		p->s_nb = -922337203685477580;
		p->c = '8';
	}
}

void	check_length_signed(t_printf *p)
{
	intmax_t	tmp;

	tmp = p->s_nb;
	p->nlen = (tmp == 0 && !(p->f & F_PRES && p->pres == 0)) ? 1 : 0;
	tmp = (tmp < 0) ? -tmp : tmp;
	while (tmp > 0)
	{
		tmp /= 10;
		p->nlen++;
	}
	exception(p);
	p->sign = (p->s_nb < 0 || p->f & F_PLUS || p->f & F_SPACE) ? 1 : 0;
	if (p->f & F_NULL)
	{
		(p->sign && p->f & F_SPACE && p->s_nb >= 0) ? buffer(p, " ", 1) : 0;
		(p->sign && p->f & F_PLUS && p->s_nb >= 0) ? buffer(p, "+", 1) : 0;
		(p->sign && p->s_nb < 0) ? buffer(p, "-", 1) : 0;
	}
	p->nlen = (p->f & F_PRES && p->pres > p->nlen) ? p->pres : p->nlen;
	((p->s_nb < 0 || p->f & F_PLUS || p->f & F_SPACE)) ? p->nlen++ : 0;
	p->padding = (p->width > p->nlen) ? p->width - p->nlen : 0;
	if (!(p->f & F_MINUS))
		(p->f & F_NULL) ? padding(p, '0') : padding(p, ' ');
	(p->f & F_NULL && p->sign) ? p->nlen-- : 0;
	(p->f & F_NULL && p->sign) ? p->sign = 0 : 0;
}

void	ft_itoa_print_signed(t_printf *p)
{
	int			i;
	intmax_t	tmp;
	char		*s;
	char		str[p->nlen];

	i = p->nlen - 1;
	s = "0123456789";
	tmp = p->s_nb;
	tmp = (tmp < 0) ? -tmp : tmp;
	while (i >= p->sign)
	{
		str[i--] = s[tmp % 10];
		tmp /= 10;
	}
	(p->sign && p->f & F_SPACE && !(p->f & F_NULL)) ? str[0] = ' ' : 0;
	(p->sign && p->f & F_PLUS && !(p->f & F_NULL)) ? str[0] = '+' : 0;
	(p->sign && p->s_nb < 0 && !(p->f & F_NULL)) ? str[0] = '-' : 0;
	buffer(p, str, p->nlen);
	(p->c != 0) ? buffer(p, &(p->c), 1) : 0;
	(p->f & F_MINUS) ? padding(p, ' ') : 0;
}

void	pf_type_signed_int(t_printf *p)
{
	p->base = 10;
	if (p->f & F_LONG2)
		p->s_nb = (intmax_t)va_arg(p->ap, long long);
	else if (p->f & F_LONG)
		p->s_nb = (intmax_t)va_arg(p->ap, long);
	else if (p->f & F_SHORT2)
		p->s_nb = (intmax_t)((char)va_arg(p->ap, int));
	else if (p->f & F_SHORT)
		p->s_nb = (intmax_t)((short)va_arg(p->ap, int));
	else if (p->f & F_MAXINT)
		p->s_nb = va_arg(p->ap, intmax_t);
	else if (p->f & F_SIZE_T)
		p->s_nb = (intmax_t)va_arg(p->ap, size_t);
	else
		p->s_nb = (int)va_arg(p->ap, int);
	check_length_signed(p);
	ft_itoa_print_signed(p);
}
