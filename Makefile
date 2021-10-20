# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsilance <jsilance@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/20 18:12:13 by jsilance          #+#    #+#              #
#    Updated: 2021/10/20 18:29:47 by jsilance         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

SRC = 

FLAGS = -Wall -Wextra -Werror

OBJ = $(SRC:.c=.o)

COMPFLAGS = -lmlx -framework -framework AppKit

all: $(NAME)

$(NAME): $(OBJ)
	@echo "Compilation..."
	# @make -C libft all
	@make -C minilibx
	@gcc $(FLAGS) $(COMPFLAGS) $(OBJ) -fsanitize=address libft.a libmlx.a -o $(NAME)
	@echo "Compilation complete!"

%.o: %.c
	@gcc -c -o $@ $? 

clean:
	@echo "Cleaning..."
	# @make -C libft clean
	@make -C minilibx clean
	@/bin/rm -f ${OBJ}
	@/bin/rm -f libft.a
	@/bin/rm -f $(NAME)
	@echo "Cleaning complete!"

fclean:	clean
	# @make -C libft fclean
	@/bin/rm -f $(NAME)

re:	fclean all

bonus: all

.PHONY: re all clean fclean test testre