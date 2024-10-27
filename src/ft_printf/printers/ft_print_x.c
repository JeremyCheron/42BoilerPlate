/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_x.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/19 15:08:45 by jcheron           #+#    #+#             */
/*   Updated: 2024/10/19 15:24:25 by jcheron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_put_hex(int n, char *chars)
{
	int	count;

	count = 0;
	if (n >= 16)
	{
		count += ft_put_hex(n / 16, chars);
		count += ft_put_hex(n % 16, chars);
	}
	else
		count += ft_print_c(chars[n]);
	return (count);
}

int	ft_print_x(unsigned int n, int format)
{
	char	*chars;

	if (format == 'x')
		chars = "0123456789abcdef";
	else
		chars = "0123456789ABCDEF";
	return (ft_put_hex(n, chars));
}
