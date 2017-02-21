;;;; a-member:

(defun a-member (element list)
	(apply #'x-or (mapcar #'(lambda(x) (eql element x) T) list))
)

(defun x-or (x y)
	(or x y)
)