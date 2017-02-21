;;;; length-aug
;; Returns length of list using aumgented recursion

(defun length-aug (list)
	(cond 
		((null list) 0)
		(T (+ 1 (length-aug (rest list))))
	)
)