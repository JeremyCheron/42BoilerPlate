/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_p.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/21 08:35:47 by jcheron           #+#    #+#             */
/*   Updated: 2024/11/12 08:59:16 by jcheron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	_ft_print_p(uintptr_t ptr)
{
	if (ptr >= 16)
		return (_ft_print_p(ptr / 16) + _ft_print_p(ptr % 16));
	return (ft_print_c("0123456789abcdef"[ptr]));
}

int	ft_print_p(uintptr_t ptr)
{
	if (!ptr)
		return (ft_printf("(nil)"));
	if (ft_print_s("0x") < 0)
		return (-1);
	return (_ft_print_p(ptr) + 2);
}
