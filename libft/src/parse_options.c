/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse_options.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/24 11:07:34 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:58:42 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	parse_flags(t_printf *p)
{
	p->s_nb = 0;
	p->us_nb = 0;
	while ((p->n = ft_strchri("#0- +", *p->form)) > -1)
	{
		p->f |= 1 << p->n;
		p->form++;
	}
	(p->f & F_PLUS) ? (p->f &= ~F_SPACE) : 0;
	(p->f & F_MINUS) ? (p->f &= ~F_NULL) : 0;
}

void	parse_width_presicion(t_printf *p)
{
	p->width = 0;
	p->pres = 0;
	p->c = 0;
	if (*p->form >= '1' && *p->form <= '9')
		p->width = ft_atoi(p->form);
	while (*p->form >= '0' && *p->form <= '9')
		p->form++;
	if (*p->form == '.')
	{
		++p->form;
		p->pres = ft_atoi(p->form);
		p->f |= F_PRES;
	}
	while (*p->form >= '0' && *p->form <= '9')
		p->form++;
}

void	parse_type(t_printf *p)
{
	(p->f & F_PRES && *p->form != 'f') ? (p->f &= ~F_NULL) : 0;
	if (*p->form == 'p')
		p->f |= F_GRID;
	if (*p->form == 'c')
		pf_type_char(p);
	else if (*p->form == 's')
		pf_type_str(p);
	else if (*p->form == 'd' || *p->form == 'i')
		pf_type_signed_int(p);
	else if (ft_strchr("oxXuUp", *p->form))
		pf_type_unsigned_int(p);
	else if (*p->form == '%')
		pf_no_type(p);
	else if (*p->form == 'f' || *p->form == 'F')
		pf_type_float(p);
	else if (*p->form == '\0')
		return ;
}

void	parse_options(t_printf *p)
{
	p->padding = 0;
	p->f = 0;
	p->float_max = 0;
	parse_flags(p);
	parse_width_presicion(p);
	if (*p->form == 'l')
		p->f |= (p->form[1] == 'l') ? F_LONG2 | F_MOD : F_LONG | F_MOD;
	else if (*p->form == 'h')
		p->f |= (p->form[1] == 'h') ? F_SHORT2 | F_MOD : F_SHORT | F_MOD;
	else if (*p->form == 'j')
		p->f |= F_MAXINT | F_MOD;
	else if (*p->form == 'z')
		p->f |= F_SIZE_T | F_MOD;
	else if (*p->form == 'L')
		p->float_max = 1;
	if ((p->f & F_LONG) || (p->f & F_SHORT) || p->float_max
			|| (p->f & F_MAXINT) || (p->f & F_SIZE_T))
		p->form++;
	if ((p->f & F_SHORT2) || (p->f & F_LONG2))
		p->form += 2;
	if (*p->form == '\0')
		return ;
	parse_type(p);
}
