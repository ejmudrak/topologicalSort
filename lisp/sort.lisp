;;;; sort.lisp
;;;; Erik Mudrak, Fall 2016
;;;; Contains all functions associated with the sort datatype for topologically sorting a DAG 

;; sort-graph: 
;; Takes in set S of nodes with no incoming edges, set L, and the graph
;; Post-conditions: Returns set L of sorted nodes
(defun sort-graph (set-s set-l graph)
	(cond 
		; if the set-s is  empty, return set-l (NOTE: functions used to clear nils from list and reverse it so that it is in order after cons'ing)
		((is-it-empty-p set-s) (clear-nils (reverse set-l)))
		((member (get-node-n graph) (get-all-dest-nodes graph)) '(CYCLIC GRAPH ERROR))   ; checks if graph is cyclic, where the current source node is checked to be a member of the destination nodes list
		;; Big stmt: calls sort-graph while:
		; 1) removing first node of set S
		; 2) adding n to tail of L
		; 3) calling insert-m-into-s
		(T (sort-graph 
			(insert-m-into-s (first set-s) (remove (first set-s) set-s) graph)
			(cons (first set-s) set-l) graph))
	)
)

;; insert-end:
;;	Inserts element into end of list
(defun insert-end (element list)
	(cond 
		((null list) (cons element list))
		;; puts together the inserted element with whatever is left of the list
		(T (cons(first list) (insert-end element (rest list))))
	)
)
