(define (last-pair lst)
  (define (last-pair-iter cur-lst prev-lst)
	(if (null? cur-lst)
		prev-lst
		(last-pair-iter (cdr cur-lst) cur-lst)))
  (last-pair-iter (cdr lst) lst))
