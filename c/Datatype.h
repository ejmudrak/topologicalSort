// Datatype.h
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// Declares datatypes STRING, EDGE, and GRAPH

#ifndef DATATYPE_H
#define DATATYPE_H

#include <stdio.h>
#include <string.h>

#define MAXGRAPHSIZE 200
#define SENTINEL "BAD HOMBRE"

#define MAXCHARSIZE 50
typedef char STRING[MAXCHARSIZE];

typedef struct {STRING startNode, endNode;} EDGE;

typedef EDGE GRAPH[MAXGRAPHSIZE]; 

#endif
