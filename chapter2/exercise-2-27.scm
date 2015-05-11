(define (deep-reverse tree)
  (define (reverse-list-iter result remain)
	(if (null? remain)
		result
		(reverse-list-iter (cons (car remain) result) (cdr remain))))
  (define (reverse-list lst)
	(reverse-list-iter () lst))
  (define (deep-reverse-iter result remain)
	(if (null? remain)
		result
		(let ((element (car remain))
			  (other (cdr remain)))
		  (if (pair? element)
			  (deep-reverse-iter (cons (reverse-list element) result) other)
			  (deep-reverse-iter (cons element result) other))))
	(deep-reverse-iter () tree)))
