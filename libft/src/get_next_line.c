/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: btyrande <btyrande@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/08/12 11:26:51 by btyrande          #+#    #+#             */
/*   Updated: 2020/02/27 12:57:15 by btyrande         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*check_array(char *array[], char **line, const int fd)
{
	char	*link;

	link = NULL;
	if (array[fd])
		if ((link = ft_strchr(array[fd], '\n')))
		{
			*link = '\0';
			*line = ft_strdup(array[fd]);
			array[fd] = ft_strcpy(array[fd], ++link);
		}
		else
		{
			*line = ft_strdup(array[fd]);
			ft_strclr(array[fd]);
		}
	else
	{
		array[fd] = ft_strnew(1);
		*line = ft_strnew(1);
	}
	return (link);
}

void	change_str(char *buf, char **line)
{
	char	*tmp;

	tmp = ft_strdup(*line);
	free(*line);
	*line = ft_strjoin(tmp, buf);
	free(tmp);
}

int		get_next_line(const int fd, char **line)
{
	int				ret;
	char			buf[BUFF_SIZE + 1];
	char			*tmp;
	static char		*array[10];
	char			*link;

	if (BUFF_SIZE < 1 || fd < 0 || fd > 9 || !line || read(fd, buf, 0) < 0)
		return (-1);
	link = check_array(array, line, fd);
	while (!link && (ret = read(fd, buf, BUFF_SIZE)))
	{
		buf[ret] = '\0';
		if ((link = ft_strchr(buf, '\n')))
		{
			*link = '\0';
			tmp = ft_strdup(++link);
			free(array[fd]);
			array[fd] = ft_strdup(tmp);
			free(tmp);
		}
		change_str(buf, line);
	}
	return (ret || ft_strlen(array[fd]) || ft_strlen(*line) || link) ? 1 : 0;
}
