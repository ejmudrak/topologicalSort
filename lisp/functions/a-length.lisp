;;;; Length with applicative programming 

(defun a-length (list)
	(apply #'+ (mapcar #'(lambda(x) 1) list)) 
)
