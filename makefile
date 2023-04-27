COURSE = cs240
SEMESTER = spring2023
CP_NUMBER = 5
LASTNAME = Liu
GITUSERID = bliu66
EXE = pr_check

REPODIR = ../$(COURSE)-$(SEMESTER)-cp$(CP_NUMBER)-$(GITUSERID)
TARFILE = CP$(CP_NUMBER)_$(LASTNAME)_$(USER)_$(GITUSERID).tar

FLAGS = -Wall -Wextra -g
# FLAGS = -Wall -O3
CC = g++

all: pr_check

$(EXE): pr_check.o
	$(CC) $(FLAGS) pr_check.o -o $@

pr_check.o: pr_check.cpp
	$(CC) $(FLAGS) -c pr_check.cpp -o $@

# Node.o:	Node.cpp Node.h
# 	$(CC) $(FLAGS) -c Node.cpp -o $@

tar:	clean
	tar cvvf $(TARFILE) $(REPODIR)
	gzip $(TARFILE)

clean:
#	rm -f $(OBJ)/*.o $(BIN)/$(EXE) *.tar.gz
	rm -f *.o pr_check