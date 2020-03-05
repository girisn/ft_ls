/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/23 15:42:36 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/12 17:33:08 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdlib.h>
# include <unistd.h>
# include <stdarg.h>
# include <stdint.h>
# include "libft.h"

# define F_GRID 1
# define F_NULL 2
# define F_MINUS 4
# define F_SPACE 8
# define F_PLUS 16
# define F_WILDCARD 32
# define F_LONG2 64
# define F_LONG 128
# define F_SHORT2 256
# define F_SHORT 512
# define F_MAXINT 1024
# define F_SIZE_T 2048
# define F_PRES 4096
# define F_UPCASE 8192
# define F_SIGN 16384
# define F_MOD 32768
# define PF_BUF_SIZE 32

typedef struct	s_printf
{
	char		*form;
	va_list		ap;
	char		buffer[PF_BUF_SIZE];
	int			index;
	int			len;
	int			slen;
	int			nlen;
	int			nlen2;
	short		f;
	int			base;
	int			float_max;
	int			width;
	int			pres;
	int			padding;
	int			sign;
	intmax_t	s_nb;
	uintmax_t	us_nb;
	intmax_t	re;
	uintmax_t	im;
	int			n;
	char		c;
}				t_printf;

int				ft_printf(const char *format, ...);
void			buffer(t_printf *p, void *str, int byte);
void			parse_options(t_printf *p);
void			padding(t_printf *p, char c);
void			pf_type_char(t_printf *p);
void			pf_type_str(t_printf *p);
void			pf_no_type(t_printf *p);
void			pf_type_signed_int(t_printf *p);
void			pf_type_unsigned_int(t_printf *p);
void			pf_type_float(t_printf *p);

#endif
