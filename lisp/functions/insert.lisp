;; insert:
;;	Inserts element into list

(defun insert (position element list)
	(cond 
		((null list) nil)
		;; puts together the inserted element with whatever is left of the list
		((= position 0) (cons element list))
		(T (cons(first list) (insert (- position 1) element (rest list))))
	)
)

;; Subsitution Method of Evaluation:

; (insert 2 9 '(1 2 3 4))
; (cons 1 (insert 1 9 '(2 3 4)))
; (cons 1 (cons 2 (insert 0 9 '(3 4))))
; (cons 1 (cons 2 (cons 9 '(3 4))))
; (cons 1 (cons 2 '(9 3 4))))
; (cons 1 '(2 9 3 4))
; (1 2 9 3 4)
