/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     |\  \\_//  /|     #   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgalyaut <tgalyaut@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/06 17:50:54 by tgalyaut          #+#    #+#             */
/*   Updated: 2023/05/29 01:21:51 by olnytim                /     \       *   */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	trans(int sig, siginfo_t *info, void *ucontext)
{
	static unsigned char	bit;
	static int				i;
	static int				pid;

	(void)ucontext;
	bit <<= 1;
	i++;
	if (sig == SIGUSR1)
		bit |= 1;
	if (i == 8)
	{
		ft_putchar_fd(bit, 1);
		i = 0;
		bit = 0;
	}
	if (info->si_pid != 0)
		pid = info->si_pid;
	kill(pid, SIGUSR1);
}

int	main(void)
{
	struct sigaction	sigaction_t;

	ft_printf("PID is: %d\n", getpid());
	sigaction_t.sa_flags = SA_SIGINFO;
	sigaction_t.sa_sigaction = trans;
	sigemptyset(&sigaction_t.sa_mask);
	sigaction(SIGUSR1, &sigaction_t, 0);
	sigaction(SIGUSR2, &sigaction_t, 0);
	while (1)
		;
	return (0);
}
