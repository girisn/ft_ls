/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pf_chars.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/24 13:02:45 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:58:48 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	padding(t_printf *p, char c)
{
	int		i;

	i = -1;
	if (p->padding < 0)
		return ;
	while (++i < p->padding)
		buffer(p, &c, 1);
}

void	pf_type_char(t_printf *p)
{
	char	c;

	c = (char)va_arg(p->ap, int);
	if (p->width > 1)
		p->padding = p->width - 1;
	if (!(p->f & F_MINUS) && p->padding)
		padding(p, ' ');
	buffer(p, &c, 1);
	if ((p->f & F_MINUS) && p->padding)
		padding(p, ' ');
}

void	pf_type_str(t_printf *p)
{
	char	*str;

	str = (char*)va_arg(p->ap, unsigned*);
	if (!str)
		str = "(null)";
	p->slen = ft_strlen(str);
	if (p->f & F_PRES)
		p->slen = (p->pres > p->slen) ? p->slen : p->pres;
	p->padding = (p->width > p->slen) ? (p->width - p->slen) : 0;
	if (!(p->f & F_MINUS) && p->padding)
		padding(p, ' ');
	buffer(p, (char*)str, p->slen);
	if ((p->f & F_MINUS) && p->padding)
		padding(p, ' ');
}

void	pf_no_type(t_printf *p)
{
	char	c;

	c = '%';
	if (p->width > 1)
		p->padding = p->width - 1;
	if (!(p->f & F_MINUS) && p->padding)
		(p->f & F_NULL) ? padding(p, '0') : padding(p, ' ');
	buffer(p, &c, 1);
	if ((p->f & F_MINUS) && p->padding)
		padding(p, ' ');
}
