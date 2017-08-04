NAME=numerical_recipes_main
SRCS=numerical_recipes_main.c
LOCAL_CONFIG = -legup-config=config.tcl
LEVEL = ..
include $(LEVEL)/Makefile.common



# Added by Rodolfo

# Linker true
#LINK = 1

# Clang debug
#DEBUG_G_FLAG = 1

# Perform in-system
#DEBUGGER = 1

#LDFLAG       += `pkg-config --libs --cflags opencv` # Não funciona pois esta opcao não é nesse local
#CFLAG       += `pkg-config --libs --cflags opencv`
#CFLAG       += -lm -lpng
#CLANG_FLAGS += `pkg-config --libs --cflags opencv`
#OPT_FLAGS   += `pkg-config --libs opencv`
