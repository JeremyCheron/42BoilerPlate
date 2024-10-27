/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_p.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/21 08:35:47 by jcheron           #+#    #+#             */
/*   Updated: 2024/10/21 10:37:21 by jcheron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_put_ptr(uintptr_t ptr)
{
	int		count;
	char	*chars;

	count = 0;
	chars = "0123456789abcdef";
	if (ptr >= 16)
	{
		count += ft_put_ptr(ptr / 16);
		count += ft_put_ptr(ptr % 16);
	}
	else
		count += ft_print_c(chars[ptr]);
	if (count < 0)
		return (-1);
	return (count);
}

int	ft_print_p(uintptr_t ptr)
{
	int	count;

	count = 0;
	count += ft_print_s("0x");
	if (count < 0)
		return (-1);
	count += ft_put_ptr(ptr);
	if (count < 0)
		return (-1);
	return (count);
}
