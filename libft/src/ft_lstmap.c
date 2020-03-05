/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/04/23 12:42:06 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:55:02 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, t_list *(*f)(t_list *elem))
{
	t_list	*new;

	if (!lst || !f)
		return (NULL);
	if (!(new = malloc(sizeof(t_list))))
		return (NULL);
	if (f(lst) != NULL)
		new = f(lst);
	new->next = ft_lstmap(lst->next, f);
	if (new->next == NULL && lst->next != NULL)
	{
		free(new->content);
		free(new);
		new = 0;
	}
	return (new);
}
