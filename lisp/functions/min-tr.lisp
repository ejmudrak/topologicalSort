;;;; min-tr

(defun min-tr (list)
	(min-hlpr (first list) (rest list))
)

(defun min-hlpr (min list)
	(cond 
		((null list) min)
		((< (first list) min) (min-hlpr (first list) (rest list)))
		(T(min-hlpr min (rest list)))
	)
)
