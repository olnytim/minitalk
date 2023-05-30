# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tgalyaut <tgalyaut@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/02 18:58:50 by tgalyaut          #+#    #+#              #
#    Updated: 2023/05/09 18:58:42 by tgalyaut         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_S 		=	server
NAME_C 		=	client
NAME_SB 	=	server_bonus
NAME_CB 	=	client_bonus
#
LIBFT 		=	libft
PREF_S 		=	src/
PREF_OBJ 	=	obj/
#
HF_DIR 		=	hf
HEADER 		=	-I $(HF_DIR)
#
SRCS_S 		=	server
SRCS_C 		=	client
SRCS_SB 	=	server_bonus
SRCS_CB 	=	client_bonus
#
CC 			=	cc
FLAGS 		=	-Wall -Werror -Wextra
FSANITIZE	=	-fsanitize=address -g3
#
SRCCL		=	$(addprefix $(PREF_S), $(addsuffix .c, $(SRCS_C)))
OBJCL		=	$(addprefix $(PREF_OBJ), $(addsuffix .o, $(SRCS_C)))
#
SRCSV		=	$(addprefix $(PREF_S), $(addsuffix .c, $(SRCS_S)))
OBJSV		=	$(addprefix $(PREF_OBJ), $(addsuffix .o, $(SRCS_S)))
#
SRCCLB		=	$(addprefix $(PREF_S), $(addsuffix .c, $(SRCS_CB)))
OBJCLB		=	$(addprefix $(PREF_OBJ), $(addsuffix .o, $(SRCS_CB)))
#
SRCSVB		=	$(addprefix $(PREF_S), $(addsuffix .c, $(SRCS_SB)))
OBJSVB		=	$(addprefix $(PREF_OBJ), $(addsuffix .o, $(SRCS_SB)))

OBJF		=	.done
#
start:
				@make -C $(LIBFT)
				@make all
all:		$(NAME_C) $(NAME_S)
#
$(NAME_C):	$(OBJCL) $(OBJF)
				@$(CC) $(FLAGS) $(OBJCL) $(HEADER) $(LIBFT)/libft.a -o $(NAME_C)
#
$(NAME_S):	$(OBJSV) $(OBJF)
				@$(CC) $(FLAGS) $(OBJSV) $(HEADER) $(LIBFT)/libft.a -o $(NAME_S)
#
$(PREF_OBJ)%.o:	$(PREF_S)%.c $(OBJF)
				@$(CC) $(FLAGS) $(HEADER) -c $< -o $@
#
$(OBJF):
				@mkdir -p $(PREF_OBJ)
				@touch $(OBJF)
#
bonus:
				@make -C $(LIBFT)
				@make allbonus
#
allbonus:		$(NAME_SB) $(NAME_CB)
#
$(NAME_SB):		$(OBJSVB) $(OBJF)
				@$(CC) $(FLAGS) $(OBJSVB) $(HEADER) libft.a -o $(NAME_SB)
#
$(NAME_CB):		$(OBJCLB) $(OBJF)
				@$(CC) $(FLAGS) $(OBJCLB) $(HEADER) libft.a -o $(NAME_CB)
#
clean:
				@rm -rf $(PREF_OBJ)
				@rm -f $(OBJF)
				@make clean -C $(LIBFT)
#
fclean:			clean
				@rm -f $(NAME_C) $(NAME_CB) $(NAME_S) $(NAME_SB)
				@rm -f $(LIBFT)/libft.a
				@rm -f libft.a
#
re:				fclean start
#
.PHONY:	start all clean fclean re bonus allbonus
#