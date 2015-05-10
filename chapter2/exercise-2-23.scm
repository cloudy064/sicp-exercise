(define (for-each func lst)
  (cond ((null? lst) True)
		(else (func (car lst)) (for-each func (cdr lst)))))
