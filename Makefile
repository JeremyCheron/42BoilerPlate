# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcheron <jcheron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/27 15:12:51 by jcheron           #+#    #+#              #
#    Updated: 2024/10/29 16:20:32 by jcheron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM					=		/usr/bin/rm -f
ECHO				=		/usr/bin/echo

# ############################################################################ #
#                                                                              #
#                           Variables                                          #
#                                                                              #
# ############################################################################ #

SRC_DIR				:=		src
INC_DIR				:=		include
OBJ_DIR				:=		obj
TARGET				:=		libftfull.a
CC					:=		cc
CCFLAGS				:=		-Wall -Werror -Wextra
include	srcs.mk

# ############################################################################ #
#                                                                              #
#                           Objects                                            #
#                                                                              #
# ############################################################################ #

OBJS				:=		$(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(FILES)))

# ############################################################################ #
#                                                                              #
#                           Colors                                             #
#                                                                              #
# ############################################################################ #

DEF_COLOR			=	\033[0;39m
GRAY				=	\033[0;90m
RED					=	\033[0;91m
GREEN				=	\033[0;92m
YELLOW				=	\033[0;93m
BLUE				=	\033[0;94m
MAGENTA				=	\033[0;95m
CYAN				=	\033[0;96m
WHITE				=	\033[0;97m
TERM_UP				=	\033[1A
TERM_CLEAR_LINE		=	\033[2K\r

# ############################################################################ #
#                                                                              #
#                           Bin / Lib                                          #
#                                                                              #
# ############################################################################ #

$(TARGET): _header _obj_header $(OBJS) _obj_footer
	@printf "$(MAGENTA)Making archive $(BLUE)\"%s\"$(MAGENTA)...$(DEF_COLOR)" $@
	@ar -rcs $@ $(OBJS)
	@printf "$(TERM_CLEAR_LINE)$(GREEN)Done building archive $(BLUE)\"%s\"$(GREEN) !\n$(DEF_COLOR)" $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@printf "$(TERM_CLEAR_LINE)$(MAGENTA)Compiling $(BLUE)\"%s\"$(MAGENTA)...\n$(DEF_COLOR)" $@
	@mkdir -p $(@D)
	@$(CC) -c $< -o $@ -I$(INC_DIR) $(CFLAGS)
	@printf "$(TERM_UP)"

# ############################################################################ #
#                                                                              #
#                           Rules                                              #
#                                                                              #
# ############################################################################ #

.PHONY:	all clean fclean re norminette _header _obj_header _obj_footer test

all:	$(TARGET)

clean:
		@printf "$(YELLOW)Removing %d objects...\n$(DEF_COLOR)" $(words $(OBJS))
		@$(RM) -rf $(OBJ_DIR)

fclean: clean
		@printf "$(YELLOW)Removing \"%s\"...\n$(DEF_COLOR)" $(TARGET)
		@$(RM) $(TARGET)

re:		fclean all

norminette:
		@norminette $(SRC_DIR) $(INC_DIR) | grep -Ev '^Notice|OK!$$'	\
		&& $(ECHO) -e '\033[1;31mNorminette KO!'						\
		|| $(ECHO) -e '\033[1;32mNorminette OK!'

_header:
		@printf "$(GREEN)Welcome to $(BLUE)\"%s\"$(GREEN) builder !\n$(DEF_COLOR)" $(TARGET)

_obj_header:
		@printf "$(MAGENTA)Building objects$(DEF_COLOR)...\n"

_obj_footer:
		@printf "$(TERM_UP)$(TERM_CLEAR_LINE)$(GREEN)Done building $(BLUE)%d$(GREEN) object(s) !\n$(DEF_COLOR)" $(words $(OBJS))
		@echo "     __       .__                                "
	@echo "    |__| ____ |  |__   ___________  ____   ____  "
	@echo "    |  |/ ___\|  |  \_/ __ \_  __ \/  _ \ /    \ "
	@echo "    |  \  \___|   Y  \  ___/|  | \(  <_> )   |  \\"
	@echo "/\\__|  |\___  >___|  /\___  >__|   \____/|___|  /"
	@echo "\______|    \/     \/     \/                  \/ "
	@echo "                      ____                       "
	@echo "                     /  _ \                      "
	@echo "  ______    ______   >  _ </\\   ______    ______ "
	@echo " /_____/   /_____/  /  <_\ \\/  /_____/   /_____/ "
	@echo "                    \\_____\\ \\                    "
	@echo "                           \\/                     "
	@echo "                     .__    .__.__  .__          "
	@echo "   ____  __ ________ |  |__ |__|  | |__|_____    "
	@echo "  / ___\\|  |  \\____ \\|  |  \\|  |  | |  \\____ \\   "
	@echo " / /_/  >  |  /  |_> >   Y  \\  |  |_|  |  |_> >  "
	@echo " \\___  /|____/|   __/|___|  /__|____/__|   __/   "
	@echo "/_____/       |__|        \\/           |__|       "


# ############################################################################ #
#                                                                              #
#                           Tests / Test Rules                                 #
#                                                                              #
# ############################################################################ #

REPO_URL			:=		git@github.com:JeremyCheron/42TestRepo.git
TEST_DIR			:=		tests/
TEST_LIBFT			:=		$(TEST_DIR)libft_test.c
TEST_OBJS_LIBFT		:=		$(TEST_DIR)libft_test.o
TEST_PRINTF			:=		$(TEST_DIR)printf_test.c
TEST_OBJS_PRINTF	:=		$(TEST_DIR)printf_test.o
clone:
		@if [ ! -d "$(TEST_DIR)" ]; then \
			echo "Cloning repository..."; \
			git clone $(REPO_URL) $(TEST_DIR); \
		else \
			echo "Directory '$(TEST_DIR)' already exists. Skipping clone then pull."; \
			git pull; \
		fi

$(TEST_DIR)%.o: $(TEST_DIR)%.c
	@printf "$(TERM_CLEAR_LINE)$(MAGENTA)Compiling test $(BLUE)\"%s\"$(MAGENTA)...\n$(DEF_COLOR)" $@
	@$(CC) -c $< -o $@ -I$(INC_DIR) $(CCFLAGS)
	@printf "$(TERM_UP)"

testlibft: $(TARGET) $(TEST_OBJS_LIBFT)
	@echo -e "$(MAGENTA)Running tests...$(DEF_COLOR)"
	@$(CC) $(CCFLAGS) -I$(INC_DIR) -o $(TEST_DIR)test $(TEST_OBJS_LIBFT) $(TARGET) -lbsd
	@./$(TEST_DIR)test

testprintf: $(TARGET) $(TEST_OBJS_PRINTF)
	@echo -e "$(MAGENTA)Running tests...$(DEF_COLOR)"
	@$(CC) $(CCFLAGS) -I$(INC_DIR) -o $(TEST_DIR)test $(TEST_OBJS_PRINTF) $(TARGET)
	@./$(TEST_DIR)test
