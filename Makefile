# #include makefile.variable

# LIBS=-lgsl -lgslcblas -lm 
# #INCLUDES=-I$(ipath)include/json-c -I$(ipath)include/gsl -I$(ipath)include/

# build:
# 	gcc -g -pthread -o cloth ./src/cloth.c ./src/heap.c ./src/array.c ./src/list.c ./src/event.c ./src/payments.c ./src/htlc.c ./src/routing.c ./src/network.c ./src/utils.c $(LIBS)
# run:
# 	GSL_RNG_SEED=1992  ./cloth
# clear:
# 	rm -r ./*.o

#### CHANGED BECAUSE COMPILER WASNT ABLE TO FIND THE LOCATION OF GSL. BECAUSE THEY ARE NOT DIRECTLY ADDED IN THE SYSTEM RATHER INSIDE LIBRARY

GSL_PATH := $(shell brew --prefix gsl)
LIBS = -lgsl -lgslcblas -lm
INCLUDES = -I$(GSL_PATH)/include
LDFLAGS = -L$(GSL_PATH)/lib

build:
	gcc -g -pthread $(INCLUDES) $(LDFLAGS) \
		-o cloth ./src/cloth.c ./src/heap.c ./src/array.c ./src/list.c \
		./src/event.c ./src/payments.c ./src/htlc.c ./src/routing.c \
		./src/network.c ./src/utils.c $(LIBS)

run:
	GSL_RNG_SEED=1992 ./cloth

clean:
	rm -f cloth *.o
