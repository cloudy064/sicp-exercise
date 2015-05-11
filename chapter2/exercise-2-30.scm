(define (map-tree func tree)
  (cond ((null? tree) tree)
		((not (pair? tree)) (func tree))
		(else (cons (map-tree func (car tree))
					(map-tree func (cdr tree))))))

(define (square-tree tree)
  (map-tree (lambda (x) (* x x)) tree))


(define (map-tree-ex func tree)
  (if (pair? tree)
	  (map (lambda (x) (map-tree-ex func x)) tree)
	  (func tree)))

(define (square-tree-ex tree)
  (map-tree-ex (lambda (x) (* x x)) tree))

;; Or you can just define procedure square-tree as follow.
;; (define (square-tree tree)
;;   (cond ((null? tree) tree)
;;         ((not (pair? tree)) (* tree tree))
;;         (else (cons (square-tree (car tree)))
;;                     (square-tree (cdr tree)))))))
