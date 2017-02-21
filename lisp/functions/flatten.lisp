;;;; flatten:
;; Takes in any list and returns an un-nested version

(defun flatten (list)
	(cond 
		((null list) nil)
		((atom (first list)) 
			(cons (first list) (flatten (rest list))))
		(T (append 
			(flatten (first list)) 
			(flatten (rest list))))
	)
)

;; SME

; (flatten '(1 (2 3)))
; (cons 1 (flatten '((2 3))))
; (cons 1 (append (flatten 2) (flatten (3))))
; (cons 1 (cons 2 (flatten 3)))
; (cons 1 (cons 2 (cons 3 nil)))