/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_p.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/21 08:35:47 by jcheron           #+#    #+#             */
/*   Updated: 2024/11/05 14:30:34 by jcheron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_put_ptr(uintptr_t ptr)
{
	if (ptr >= 16)
		return (ft_put_ptr(ptr / 16) + ft_put_ptr(ptr % 16));
	return (ft_print_c("0123456789abcdef"[ptr]));
}

int	ft_print_p(uintptr_t ptr)
{
	int	count;

	count = 0;
	if (!ptr)
		return (ft_printf("(nil)"));
	count += ft_print_s("0x");
	if (count < 0)
		return (-1);
	count += ft_put_ptr(ptr);
	if (count < 0)
		return (-1);
	return (count);
}
