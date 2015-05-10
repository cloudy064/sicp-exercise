(define (same-parity x . y)
  (define (same-parity-iter remain-lst judge-method)
	(if (null? remain-lst)
		remain-lst
		(let ((element (car remain-lst))
			  (remain (same-parity-iter (cdr remain-lst) judge-method)))
		  (if (judge-method element)
			  (cons element remain)
			  remain))))
  (let ((judge-method (if (odd? x) odd? even?)))
	(same-parity-iter (cons x y) judge-method)))


;; We can define a filter procedure, which accept two parameters, one as filter function, the other as list to filter.

(define (filter func lst)
  (if (null? lst)
	  lst
	  (let ((element (car lst))
			(remain (filter func (cdr lst))))
		(if (func element)
			(cons element remain)
			remain))))


;; And then we can define same-parity procedure as follow:
;; (define (same-parity x . y)
;;   (let ((judge-method (if odd? x) odd? even?))
;;     (filter judge-method (cons x y))))
