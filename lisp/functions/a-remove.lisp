;;;; a-remove:
;; Remove applicatively 

(defun a-remove (element list)
	(apply #'append(mapcar #'(lambda(x) 
		(cond
			((eql element x) nil)
			(T (list x))  
		)) list)
	)
)