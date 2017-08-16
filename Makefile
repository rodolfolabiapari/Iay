NAME=numerical_recipes_main
LOCAL_CONFIG = -legup-config=config.tcl
ifeq ($(NO_OPT),)
	NO_OPT=1
endif
ifeq ($(NO_INLINE),)
	NO_INLINE=1
endif
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
CFLAG       += -lm
#CLANG_FLAGS += `pkg-config --libs --cflags opencv`
#OPT_FLAGS   += `pkg-config --libs opencv`
