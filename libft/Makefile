# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tgalyaut <tgalyaut@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/16 15:54:05 by tgalyaut          #+#    #+#              #
#    Updated: 2023/05/09 17:51:39 by tgalyaut         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 	=	libft.a
#
SRCS 	=	ft_isalnum.c		ft_isascii.c	ft_isprint.c\
			ft_strlcat.c		ft_strlen.c		ft_toupper.c\
			ft_atoi.c			ft_isalpha.c	ft_isdigit.c\
	 		ft_tolower.c		ft_memset.c		ft_bzero.c\
			ft_memcpy.c			ft_memmove.c	ft_strchr.c\
			ft_strrchr.c		ft_strncmp.c	ft_memchr.c\
			ft_memcmp.c			ft_strnstr.c	ft_strlcat.c\
			ft_strlcpy.c		ft_strdup.c		ft_calloc.c\
			ft_substr.c			ft_strjoin.c	ft_strtrim.c\
			ft_putchar_fd.c		ft_putstr_fd.c	ft_putendl_fd.c\
			ft_putnbr_fd.c		ft_itoa.c		ft_strmapi.c\
			ft_striteri.c		ft_split.c		ft_printf.c\
			get_next_line_bonus.c	ft_putf.c	ft_conversions.c\
			get_next_line_utils_bonus.c
#
SRCS_B 	=	ft_lstsize.c		ft_lstnew.c		ft_lstadd_front.c\
			ft_lstadd_back.c	ft_lstiter.c	ft_lstlast.c\
			ft_lstdelone.c		ft_lstclear.c	ft_lstmap.c
#
CC 		=	cc
CFLAGS 	=	-Wall -Werror -Wextra
#
HEADER	=	libft.h
OBJ		=	$(SRCS:.c=.o)
OBJ_B	=	$(SRCS_B:.c=.o)
#
all		:	$(NAME)
#
$(NAME)	:	$(OBJ) $(HEADER)
	@ar r $(NAME) $(OBJ)
#
bonus	:
	@make OBJ="$(OBJ_B)" all
#
clean	:
	@rm -f $(OBJ) $(OBJ_B)
#
fclean	:	clean
	@rm -f $(NAME)
#
re		:	fclean all
#
.PHONY	:	all clean fclean re bonus
#
