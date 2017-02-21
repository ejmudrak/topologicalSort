;;;; a-min 
;; Applicative minimum function

(defun a-min (list)
	(reduce #'(lambda(x y)
		(cond 
			((< x y) x)
			(T y)
		)
	) list)
)
