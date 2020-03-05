/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/23 15:44:08 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:59:25 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	buffer(t_printf *p, void *str, int byte)
{
	int		i;
	int		delta;

	i = 0;
	if (byte == 0)
		return ;
	while (p->index <= PF_BUF_SIZE)
	{
		delta = PF_BUF_SIZE - p->index;
		delta = (delta > byte) ? byte : delta;
		ft_memcpy(&(p->buffer[p->index]), (void*)(str + i), delta);
		p->index += delta;
		i += delta;
		byte -= delta;
		if (byte == 0 && p->index < PF_BUF_SIZE)
			break ;
		write(1, p->buffer, p->index);
		p->len += p->index;
		p->index = 0;
		ft_bzero(p->buffer, PF_BUF_SIZE);
	}
}

int		ft_printf(const char *format, ...)
{
	t_printf	p;

	ft_bzero(&p, sizeof(&p));
	p.index = 0;
	p.len = 0;
	p.form = (char*)format;
	va_start(p.ap, format);
	while (*p.form)
	{
		if (*p.form == '%')
		{
			p.form++;
			if (!*p.form)
				break ;
			parse_options(&p);
		}
		else
			buffer(&p, p.form, 1);
		if (*p.form == '\0')
			break ;
		p.form++;
	}
	write(1, p.buffer, p.index);
	va_end(p.ap);
	return (p.len + p.index);
}
