;;;; flatten function

(defun flattenhlpr (list flat)
	(cond ((null list) nil)
		((atom (first list)) (cons (first list) (flattenhlpr (rest list) flat)))
		(T (append (flattenhlpr (first list) flat) (flattenhlpr (rest list) flat)))
	)
)