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

;; Also, you can write this procedure just like this:
;; (define (deep-reverse tree)
;;   (if (pair? tree)
;;     (reverse (map deep-reverse tree))
;;     tree))
;; You can think of this problem as follow.
;; For example, we have to reverse the tree
;;          (list 1 2 (list 2 3 4) 3 4 (list 1 2))
;; We can reverse every subtree first(if it is a leaf, the reverse of it is itself),
;; namely apply deep-reverse to each element of tree. (map deep-reverse tree)
;; And then, we reverse the result of these elements. (reverse (map deep-reverse tree))
;; And now, we exactly get the result of (deep-reverse tree).
