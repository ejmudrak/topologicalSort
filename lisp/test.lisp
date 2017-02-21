;;; test.lisp
;; includes test DAG's for easy program use

;; test1: inputs dag of letter atoms
(defun graph1 () 
	 '((a d) (b d) (b e) (c e) (c h) (d f) (d g) (d h) (e g))
)

;; test2: inputs dag of number atoms
(defun graph2 ()
	'((5 11) (7 11) (7 8) (3 8) (3 10) (11 2) (11 9) (11 10) (8 9))
)

;; empty-graph: inputs empty graph
(defun empty-graph ()
	'()
)

(defun cyclic-graph ()
	'((a b) (b c) (c a) (d a))
)
(defun cyclic2 ()
	'((a b) (b c) (c e) (e f) (f c))
)

(defun graph3 ()
	'((3 7) (3 8) (4 6) (4 10) (5 7) (5 9) (6 8) (6 9) (7 9))
)

;; long DAG
(defun graph4 ()
	'((a d) (a e) (b f) (c e) (d e) (d g) (e f) (e j) (f i) (g k) (i h) (h k))
)
