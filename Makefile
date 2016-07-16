## Generic makefile by Heedong Goh <wellposed@gmail.com> ########
## Name of the executable
NAME = transpose
## Complier
CC = icpc
## Source extension
SEXT = cpp
## Source path
SDIR = .
## Output path
ODIR = .
## Library path
LIBS = -L/usr/local/lib
## Include path
INC = -I./
## General compile option
CFLAGS = -Wall -Wextra -pedantic -std=c++11
## Release option
RFLAGS = -O3
## DO NOT CHANGE ################################################
.PHONY: all clean test help

TARGET = $(ODIR)/$(NAME)
SRCS = $(wildcard $(SDIR)/*.$(SEXT))
OBJS = $(SRCS:.$(SEXT)=.o)

all : $(TARGET)
$(TARGET): $(OBJS)
	$(CC) $(LIBS) $(OBJS) -o $(TARGET) 
	rm $(OBJS)
$(OBJS): $(SRCS)
	@mkdir -p $(ODIR)
	$(CC) $(CFLAGS) $(RFLAGS) $(INC) -c $(SRCS) -o $(OBJS)
clean:
	rm $(TARGET)
test:
	@echo "Sources files: " $(SRCS)
	@echo "Objects files: " $(OBJS)
	@echo "Executable:    " $(TARGET)
help:
	@echo "usage:"
	@echo "      make       -> build"
	@echo "      make clean -> removes executable"
	@echo "      make test  -> lists source files"
#################################################################

