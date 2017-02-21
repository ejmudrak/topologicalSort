// graph.h
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// graph datatype and associated function declarations

#ifndef GRAPH_H
#define GRAPH_H

#include "Datatype.h"

FILE *graphFile;

// readGraph: 
// Reads input file graph in to graph datatype 
void readGraph (FILE *f, STRING fileName, EDGE *g);

// removeEdge:
// Takes in graph g and position i
// Removes the entire edge at i from the graph
void removeEdge (int i, EDGE *g);

/// noIncomingEdges: 
//	Takes in an element, array, and size 
// 	Loops through the array in search of the element.
//	Returns 1 if the node has no incoming edges, 0 if it does have incoming edges
int noIncomingEdges (STRING element, EDGE *g);

#endif
