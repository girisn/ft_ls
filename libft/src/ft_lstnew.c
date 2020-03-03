/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstnew.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/18 14:44:13 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:55:07 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static t_list	*ft_lst(t_list *list, void const *content, size_t content_size)
{
	if (content == NULL)
	{
		list->content = NULL;
		list->content_size = 0;
	}
	else
	{
		ft_memcpy(list->content, content, content_size);
		list->content_size = content_size;
	}
	list->next = NULL;
	return (list);
}

t_list			*ft_lstnew(void const *content, size_t content_size)
{
	t_list *list;

	if (!(list = (t_list*)ft_memalloc(sizeof(t_list))))
		return (NULL);
	else
	{
		if (!(list->content = (void*)ft_memalloc(content_size)))
		{
			free(list);
			list = NULL;
			return (NULL);
		}
		else
		{
			list = ft_lst(list, content, content_size);
			return (list);
		}
	}
}
