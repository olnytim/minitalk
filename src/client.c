/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           |\  \\_//  /|     #   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgalyaut <tgalyaut@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/02 18:33:00 by tgalyaut          #+#    #+#             */
/*   Updated: 2023/05/29 01:18:59 by olnytim                /     \       *   */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static int	g_resp;

static void	mail(int pid, char str)
{
	int	bit;

	bit = 8;
	while (bit-- > 0)
	{
		resp = 0;
		if ((str >> bit) % 2)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		while (resp != 1)
			;
	}
}

static void	go(int sig, siginfo_t *info, void *ucontext)
{
	(void)info;
	(void)ucontext;
	resp = 1;
	if (sig == SIGUSR2)
		exit(0);
}

int	main(int ac, char **av)
{
	int					pid;
	int					i;
	struct sigaction	sigaction_t;

	if (ac == 3)
	{
		i = -1;
		sigaction_t.sa_flags = SA_SIGINFO;
		sigaction_t.sa_sigaction = go;
		sigemptyset(&sigaction_t.sa_mask);
		sigaction(SIGUSR1, &sigaction_t, 0);
		sigaction(SIGUSR2, &sigaction_t, 0);
		pid = ft_atoi(av[1]);
		while (av[2][++i])
			mail(pid, av[2][i]);
		mail(pid, '\n');
	}
	return (0);
}
