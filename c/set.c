// set.h
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// set function implementations

#include "set.h"

// notSentinel:
// Checks if element is equivalent to sentinel and returns 0 if true 
int notSentinel (STRING element) {
	return strcmp(element, SENTINEL);
}

// noDupes:
// Takes in element and array
// Returns 1 if the element is already in the array
int noDupes (STRING element, STRING *a) {
	int flag = 1;
	int i = 0;
	for (i=0; notSentinel(a[i]); i++) {
		if (!strcmp(element, a[i])) {
			flag = 0;
		}
	}	
	return flag;
}

// insertAtEnd:
// Takes in element and array
// Inserts element right before the sentinel, aka the end of the list
void insertAtEnd (STRING element, STRING *a) {
	// printf("\tPassing in %s for insertion\n", element);
	int i;
	for (i=0; notSentinel(a[i]); i++) {
		// Takes us to the end of the array
	}
	strcpy(a[i+1], SENTINEL);
	strcpy(a[i], element);
}

// removeElement:
// Takes in an element and array, removing the element from the array
void removeNodeN (STRING *a) {
	// printf("\tPassing in %s for removal\n", element);
	int j;
	for (j=0; notSentinel(a[j]); j++) {
		// Remove the element by putting the next element in its place, until the end of the array is reached
		strcpy(a[j], a[j+1]);
	}
}

// printSet: 
// takes in set array and prints out all of its elements
void printSet(STRING *a) {
	int i;
	printf("The sorted contents of set L are:\n");
	for (i=0; notSentinel(a[i]); i++) {
		printf("%s, ", a[i]);
	}
	printf("\n");
}

/// getS:
// Takes in (empty) setS and graph and creates set S,
// 	by looping through the startNode of each edge, providing a duplicate-free set of all nodes with no incoming edges
void getS (STRING *set, EDGE *g) {
	int setIndex = 0; 
	int i;
	for (i=0; notSentinel(g[i].startNode) && notSentinel(g[i].endNode); i++) {
		if (noIncomingEdges(g[i].startNode, g) && noDupes(g[i].startNode, set)) {
			insertAtEnd(g[i].startNode, set);		// add the node element to S
		}
	}
}
