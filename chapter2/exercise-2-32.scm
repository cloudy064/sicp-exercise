;; We can consider this problem as follow:
;; We can divide set S into two parts,
;; one part with (car s), the other without (car s).
;; So the subsets of S is just the combination of
;; subsets of the first part and the on of the second part.
;; And then we can define this procedure like this.

(define (subsets s)
  (if (null? s)
	  (list s)
	  (let ((rest (subsets (cdr s))))
		(append rest (map (lambda (x) (cons (car s) x)) rest)))))

