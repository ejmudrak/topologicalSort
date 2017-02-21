// set.h
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// setL and setS datatypes and associated function declarations

#ifndef SET_H
#define SET_H

#include "Datatype.h"
//#include "graph.h"


// notSentinel:
// Checks if element is equivalent to sentinel and returns 0 if true 
int notSentinel (STRING element);

// insertAtEnd:
// Takes in element and array
// Inserts element right before the sentinel, aka the end of the list
void insertAtEnd (STRING element, STRING *a);

// removeElement:
// Takes in an element and array, removing the element from the array
void removeNodeN (STRING *a);

// printSet: 
// takes in set array and prints out all of its elements
void printSet(STRING *a);

/// getS:
// Takes in (empty) setS and graph and creates set S,
// 	by looping through the startNode of each edge, providing a duplicate-free set of all nodes with no incoming edges
void getS (STRING *set, EDGE *g);

#endif
