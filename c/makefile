# makefile
# Erik Mudrak, Fall 2016
# Principles of Programming Languages
# topological sort program 

sort: sort.o set.o graph.o
	gcc -o sort sort.o set.o graph.o
sort.o: sort.c sort.h set.h graph.h Datatype.h
	gcc -c sort.c 
set.o: set.c set.h graph.h Datatype.h
	gcc -c set.c 
graph.o: graph.c graph.h Datatype.h
	gcc -c graph.c
clean: 
	rm *.o
