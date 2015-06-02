.SUFFIXES : .x .o .c .s

KROOT = ~/BSP/linux-2.6.32.4_fa93
TROOT = ~/arm-linux-tools/4.2.1
INCS = -I$(TROOT)/arm-linux/include
LIBS = -L$(TROOT)/lib/gcc/arm-linux/4.2.1
CFLAGS = -Wall -Wextra
STRIP = arm-linux-strip

#CC = arm-linux-gcc
CC = gcc

TARGET = get_random
SRCS = get_random.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET):$(OBJS) $(CRYPTOLIB)
	$(CC) $(CFLAGS) $(OBJS) $(CRYPTOLIB) -o $@ $(LIBS) -static 
#	$(STRIP) $(TARGET)

%.o:%.c
	$(CC) $(CFLAGS) $(INCS) -c $<

clean:
	rm -f *.o
	rm -f $(TARGET)
