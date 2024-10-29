/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_x.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/19 15:08:45 by jcheron           #+#    #+#             */
/*   Updated: 2024/10/23 13:59:56 by jcheron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	_ft_print_x(unsigned int n, char *chars)
{
	if (n >= 16)
		return (_ft_print_x(n / 16, chars) + _ft_print_x(n % 16, chars));
	return (ft_print_c(chars[n]));
}

int	ft_print_x(unsigned int n, int format)
{
	char	*_chars;

	if (format == 'x')
		_chars = "0123456789abcdef";
	else
		_chars = "0123456789ABCDEF";
	return (_ft_print_x(n, _chars));
}
