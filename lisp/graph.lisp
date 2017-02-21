;;;; graph.lisp
;;; Erik Mudrak, Fall 2016
;;; Principles of Programming Languages - Program 1
;;; Takes a direct acyclic graph (DAG) and returns a topologically sorted list of nodes

;; top-o-sort:
;	main function: takes in graph and calls functions that returns the top-o sorted list up to it
(defun top-o-sort (graph)
	(cond
		; if the graph is empty, return an error of nil:
		((is-it-empty-p graph) '(ERROR - The inputted graph is empty!))

		; else, return the list L
		(T (sort-graph (get-s (get-all-src-nodes graph) (get-all-dest-nodes graph)) nil graph))
	)
)

;; get-all-src-nodes: returns list of source nodes
(defun get-all-src-nodes (graph)
	(cond
		((null graph) nil)
		(T (cons (get-first-edge(first graph)) (get-all-src-nodes(rest graph))))
	)
)

;; get-all-dest-nodes: returns list of destination nodes
(defun get-all-dest-nodes (graph)
	(cond
		((null graph) nil)
		(T (cons (get-rest-edge(first graph)) (get-all-dest-nodes(rest graph))))
	)
)

;; get-node-n: returns single source node of graph
(defun get-node-n (graph)
	(get-first-edge (first graph))
)

;; get-node-m: returns single destination node of graph
(defun get-node-m (graph)
	(get-rest-edge (first graph))
)

;; get-first-edge: returns source node of edge
(defun get-first-edge (graph)
	(first graph)
)

;; get-rest-edge: returns destination node of edge
(defun get-rest-edge (graph)
	(first(rest graph))
)

;; get-m: determines whether node m has any other incoming edges, returning the node m if it does not
;; Pre-condition: Takes in node-m and the graph
;; Post-condition: Returns nil if node-m has other incoming edges, or returns node-m if it does not
(defun get-m (node-m graph)
	(cond
		((member node-m (get-all-dest-nodes graph)) nil)	; determines if node-m is an incoming edge, if so return nothing
		(T node-m)					     	; if not, return node-m
	)
)

;; is-it-empty-p: returns T if list is empty, nil if it has contents
(defun is-it-empty-p (list)
	(null list)
)

;; remove-edge: takes in edge and returns a graph without that edge
(defun remove-edge (graph)
	(remove (first graph) graph)
)
