/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pf_numbers_unsigned.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/24 15:19:46 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:58:56 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	base(t_printf *p)
{
	if (*p->form == 'X')
		p->f |= F_UPCASE;
	if (*p->form == 'x' || *p->form == 'X' || *p->form == 'p')
		p->base = 16;
	else if (*p->form == 'o')
		p->base = 8;
	else
		p->base = 10;
}

void	check_length_unsigned(t_printf *p)
{
	uintmax_t	tmp;

	tmp = p->us_nb;
	(tmp == 0) ? p->nlen = 1 : 0;
	while (tmp > 0)
	{
		tmp /= p->base;
		p->nlen++;
	}
	(p->f & F_PRES && !p->us_nb && !(*p->form == 'o'
			&& p->f & F_GRID)) ? p->nlen = 0 : 0;
	if (*p->form == 'o' && (p->f & F_GRID) && p->us_nb && p->pres <= p->nlen)
		p->nlen2++;
	if (ft_strchr("xX", *p->form) && (p->f & F_GRID) && p->us_nb)
		p->nlen2 += 2;
	if (p->f & F_NULL && ((ft_strchr("xX", *p->form) && (p->f & F_GRID)) ||
		*p->form == 'p') && p->us_nb)
		(ft_strchr("xp", *p->form)) ? buffer(p, "0x", 2) : buffer(p, "0X", 2);
	(*p->form == 'p' && !p->us_nb) ? p->nlen = 3 : 0;
	if (p->f & F_PRES)
		p->nlen = (p->pres > p->nlen) ? p->pres : p->nlen;
	(*p->form == 'p' && p->width && p->us_nb) ? p->width -= 2 : 0;
	p->padding = p->width - p->nlen - p->nlen2;
	if (!(p->f & F_MINUS))
		(p->f & F_NULL) ? padding(p, '0') : padding(p, ' ');
}

void	ft_itoa_print_unsigned(t_printf *p, char *s, uintmax_t num)
{
	int			i;
	char		str[p->nlen + p->nlen2];

	if (ft_strchr("xXop", *p->form) && p->nlen2 && p->f & F_NULL
			&& !(p->f & F_GRID && *p->form == 'o'))
		p->nlen2 -= (*p->form == 'o') ? 1 : 2;
	i = (*p->form == 'p' && !p->us_nb) ? 0 : p->nlen + p->nlen2;
	while (--i >= 0)
	{
		str[i] = s[num % p->base];
		num /= p->base;
	}
	(!(p->f & F_NULL) && ft_strchr("xX", *p->form) && p->f & F_GRID &&
		p->us_nb) ? str[1] = 'x' : 0;
	(!(p->f & F_NULL) && ft_strchr("xXo", *p->form) && p->f & F_GRID &&
		p->us_nb) ? str[0] = '0' : 0;
	(!(p->f & F_NULL) && *p->form == 'p') ? buffer(p, "0x", 2) : 0;
	i = -1;
	if (p->f & F_UPCASE)
		while (++i < p->nlen + p->nlen2)
			str[i] = ft_toupper(str[i]);
	(*p->form == 'p' && !p->us_nb && !(p->f & F_PRES && p->pres == 0))
		? buffer(p, "0", 1) : 0;
	(*p->form != 'p' || p->us_nb) ? buffer(p, str, p->nlen + p->nlen2) : 0;
	(p->f & F_MINUS) ? padding(p, ' ') : 0;
}

void	pf_type_unsigned_int(t_printf *p)
{
	base(p);
	p->nlen = 0;
	p->nlen2 = 0;
	if (*p->form == 'p')
		p->us_nb = (uintmax_t)va_arg(p->ap, unsigned int*);
	else if (p->f & F_LONG2)
		p->us_nb = (uintmax_t)va_arg(p->ap, unsigned long long);
	else if (p->f & F_LONG || *p->form == 'U')
		p->us_nb = (uintmax_t)va_arg(p->ap, unsigned long);
	else if (p->f & F_SHORT2)
		p->us_nb = (uintmax_t)((unsigned char)va_arg(p->ap, int));
	else if (p->f & F_SHORT)
		p->us_nb = (uintmax_t)((unsigned short)va_arg(p->ap, int));
	else if (p->f & F_MAXINT)
		p->us_nb = (uintmax_t)va_arg(p->ap, uintmax_t);
	else if (p->f & F_SIZE_T)
		p->us_nb = (uintmax_t)va_arg(p->ap, size_t);
	else
		p->us_nb = (uintmax_t)((unsigned int)va_arg(p->ap, int));
	check_length_unsigned(p);
	ft_itoa_print_unsigned(p, "0123456789abcdef", p->us_nb);
}
