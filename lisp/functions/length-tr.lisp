;; length - tail recursion

(defun length-tr (list)
	(length-hlpr 0 list)
)

(defun length-hlpr(count list)
	(cond
		((null list) count)
		(T (length-hlpr(+ count 1) (rest list)))
	)
)