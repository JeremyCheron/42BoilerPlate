/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_u.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/21 10:23:02 by jcheron           #+#    #+#             */
/*   Updated: 2024/10/21 10:28:38 by jcheron          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_put_u(unsigned int n)
{
	int	count;

	count = 0;
	if (n > 10)
	{
		count += ft_put_u(n / 10);
		count += ft_put_u(n % 10);
	}
	else
		count += ft_print_c(n + 48);
	return (count);
}

int	ft_print_u(unsigned int n)
{
	int	count;

	count = 0;
	count += ft_put_u(n);
	if (count < 0)
		return (-1);
	return (count);
}
