;; reverse-tr:
;;	Reverse tail recursive

(defun reverse-tr (list)
	(reverse-hlpr list nil)
)

(defun reverse-hlpr (list reverse)
	(cond
		((null list) reverse)
		(T (reverse-hlpr (rest list) (cons (first list) reverse)))
	)
)