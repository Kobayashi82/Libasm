# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vzurera- <vzurera-@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/27 12:45:36 by vzurera-          #+#    #+#              #
#    Updated: 2025/07/16 17:48:00 by vzurera-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ───────────────────────────────────────────────────────────── #
# ─────────────────────── CONFIGURATION ─────────────────────── #
# ───────────────────────────────────────────────────────────── #

# ──────────── #
# ── COLORS ── #
# ──────────── #

NC    		= \033[0m
RED     	= \033[0;31m
GREEN   	= \033[0;32m
YELLOW  	= \033[0;33m
CYAN    	= \033[0;36m
WHITE   	= \033[0;37m
INV_CYAN	= \033[7;36m
BG_CYAN		= \033[40m
FG_YELLOW	= \033[89m
COUNTER 	= 0

# ─────────── #
# ── FLAGS ── #
# ─────────── #

CC			= clang
FLAGS		= -Wall -Wextra -Werror

# ───────────────── #
# ── DIRECTORIES ── #
# ───────────────── #

OBJ_DIR		= build/obj/
LIB_DIR		= build/lib/
SRC_DIR		= src/

# ────────── #
# ── NAME ── #
# ────────── #

NAME		= libasm.a
TEST		= libasm

# ─────────── #
# ── FILES ── #
# ─────────── #

SRCS		= ft_strlen.s \
       		  ft_strcpy.s \
       		  ft_strcmp.s \
       		  ft_write.s \
       		  ft_read.s \
       		  ft_strdup.s

# ────────────────────────────────────────────────────────── #
# ───────────────────────── NORMAL ───────────────────────── #
# ────────────────────────────────────────────────────────── #

all: $(NAME)

OBJS		= $(SRCS:%.s=$(OBJ_DIR)%.o)

$(NAME): _normal $(OBJS)
#	Create folder
	@mkdir -p $(LIB_DIR)
#	Compile library
	@if [ -f $(LIB_DIR)$(NAME) ] && [ ! -f .line ]; then \
        printf "\r%50s\r\t$(CYAN)Up to date  $(GREEN)✓ $(YELLOW)$(NAME)$(NC)\n"; \
    else \
		printf "\r%50s\r\t$(CYAN)Compiled    $(GREEN)✓ $(YELLOW)$(NAME)$(NC)\n"; \
		ar rcs $(LIB_DIR)$(NAME) $(OBJS); \
    fi
	@rm -f .line
	@printf "\t$(WHITE)────────────────────────\n$(NC)"
	@if [ -f $(TEST) ]; then \
        printf "\r%50s\r\t$(CYAN)Tester      $(GREEN)✓ $(YELLOW)$(TEST)$(NC)\n"; \
		$(CC) $(FLAGS) src/main.c -L$(LIB_DIR) -lasm -o $(TEST); \
    else \
		printf "\r%50s\r\t$(CYAN)Tester      $(GREEN)✓ $(YELLOW)$(TEST)$(NC)\n"; \
		$(CC) $(FLAGS) src/main.c -L$(LIB_DIR) -lasm -o $(TEST); \
    fi

#	Progress line
	@$(MAKE) -s _progress; printf "\n"
#	Restore cursor
	@$(MAKE) -s _show_cursor

# ───────────── #
# ── OBJECTS ── #
# ───────────── #

-include $(DEPS)

$(OBJ_DIR)%.o: $(SRC_DIR)%.s
#	Create folder
	@mkdir -p $(@D)
#	Compile objects
	@filename=$$(basename $<); filename=$${filename%.*}; \
	BAR=$$(printf "/ — \\ |" | cut -d" " -f$$(($(COUNTER) % 4 + 1))); \
	printf "\r%50s\r\t$(CYAN)Compiling... $(GREEN)$$BAR $(YELLOW)$$filename$(NC)"; \
	$(eval COUNTER=$(shell echo $$(($(COUNTER)+1))))
	@nasm -f elf64 -o $@ $<
	@touch .line

# ───────────────── #
# ── EXTRA RULES ── #
# ───────────────── #

_normal:
#	Hide cursor
	@$(MAKE) -s _hide_cursor
#	Create folders
	@mkdir -p build/lib
#	Title
	@if [ ! -f .is_re ]; then clear; $(MAKE) -s _title; fi; rm -f .is_re
	@printf "\t$(WHITE)────────────────────────\n$(NC)"
	@printf "\n\t$(WHITE)────────────────────────$(NC)\033[1A\r"

# ───────────────────────────────────────────────────────────── #
# ───────────────────────── RE - CLEAN ─────────────────────────#
# ───────────────────────────────────────────────────────────── #

# ───────────── #
# ── RE-MAKE ── #
# ───────────── #

re: fclean
	@printf "\033[1A\033[1A\r"
	@touch .is_re
#	Execute $(NAME)
	@$(MAKE) -s $(NAME)

# ─────────── #
# ── CLEAN ── #
# ─────────── #

clean:
	@rm -f .is_re
	@$(MAKE) -s _title
#	Delete objects
	@$(MAKE) -s _delete_objects
	@printf "\r%50s\r\t$(CYAN)Deleted     $(GREEN)✓ $(YELLOW)objects$(NC)\n"
#	Delete folder
	@-find $(OBJ_DIR) -type d -empty -delete >/dev/null 2>&1 || true
#	Hide cursor
	@$(MAKE) -s _hide_cursor
#	Progress line
	@$(MAKE) -s _progress; printf "\n"
#	Restore cursor
	@$(MAKE) -s _show_cursor

# ──────────── #
# ── FCLEAN ── #
# ──────────── #

fclean:
	@rm -f .is_re
	@$(MAKE) -s _title
#	Delete objects
	@$(MAKE) -s _delete_objects
#	Delete $(NAME)
	@if [ -f $(LIB_DIR)$(NAME) ]; then \
		printf "\t$(CYAN)Deleting... $(YELLOW)$(NAME)$(NC)"; \
		rm -f $(LIB_DIR)$(NAME); \
	fi
	@rm -f $(TEST)
#	Hide cursor
	@$(MAKE) -s _hide_cursor
	@printf "\r%50s\r\t$(CYAN)Deleted     $(GREEN)✓ $(YELLOW)$(NAME)$(NC)\n"
	@printf "\t$(WHITE)────────────────────────\n$(NC)"
	@printf "\r%50s\r\t$(CYAN)Deleted     $(GREEN)✓ $(YELLOW)$(TEST)$(NC)\n"
#	Delete folders
	@-find $(LIB_DIR) -type d -empty -delete >/dev/null 2>&1 || true
	@-find $(OBJ_DIR) -type d -empty -delete >/dev/null 2>&1 || true
	@-find build -type d -empty -delete >/dev/null 2>&1 || true
#	Progress line
	@$(MAKE) -s _progress; printf "\n"
#	Restore cursor
	@$(MAKE) -s _show_cursor

# ───────────────────────────────────────────────────────────── #
# ───────────────────────── FUNCTIONS ───────────────────────── #
# ───────────────────────────────────────────────────────────── #

# ─────────── #
# ── TITLE ── #
# ─────────── #

_title:
	@printf "\n\t$(INV_CYAN)         $(NC)$(INV_CYAN)$(shell echo 'libasm' | tr a-z A-Z | tr '_' ' ')$(INV_CYAN)         $(NC)\n"

# ───────────── #
# ── CURSORS ── #
# ───────────── #

_hide_cursor:
	@printf "\e[?25l"

_show_cursor:
	@printf "\e[?25h"

# ──────────────────── #
# ── DELETE OBJECTS ── #
# ──────────────────── #

_delete_objects:
	@printf "\t$(WHITE)────────────────────────\n$(NC)"
	@printf "\n\t$(WHITE)────────────────────────$(NC)\033[1A\r"
	@COUNTER=0; \
	for file in $(OBJ_DIR)/*.o; do \
		BAR=$$(printf "/ — \\ |" | cut -d" " -f$$((COUNTER % 4 + 1))); \
		filename=$$(basename $$file); \
		for src in $(SRCS); do \
			srcname=$$(basename $$src .s); \
			if [ $$filename = $$srcname.o ]; then \
				rm -f $$file $$(dirname $$file)/$$srcname.d; \
				filename=$${filename%.*}; \
				printf "\r%50s\r\t$(CYAN)Deleting... $(GREEN)$$BAR $(YELLOW)$$filename$(NC)"; sleep 0.05; \
				COUNTER=$$((COUNTER+1)); \
				break; \
			fi; \
		done; \
	done; printf "\r%50s\r"

# ─────────────────── #
# ── PROGRESS LINE ── #
# ─────────────────── #

_progress:
	@total=24; printf "\r\t"; for i in $$(seq 1 $$total); do printf "$(RED)─"; sleep 0.01; done; printf "$(NC)"
	@total=24; printf "\r\t"; for i in $$(seq 1 $$total); do printf "─"; sleep 0.01; done; printf "\n$(NC)"

# ─────────── #
# ── PHONY ── #
# ─────────── #

wipe:
	@rm -rf build; rm -f .is_re; rm -f $(TEST);

.PHONY: all clean fclean re _UpToDate _Compile _normal _hide_cursor _show_cursor _progress wipe