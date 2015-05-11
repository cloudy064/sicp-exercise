(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (has-more-branch? branch)
  (pair? (branch-structure branch)))

(define (branch-weight branch)
  (if (has-more-branch? branch)
	  (total-weight (branch-structure branch))
	  (branch-structure branch)))
							 
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
	 (branch-weight (right-branch mobile))))

(define (moment branch)
  (* (branch-length branch)
	 (branch-weight branch)))

(define (branch-balance? branch)
  (if (has-more-branch? branch)
	  (mobile-balance? (branch-structure branch))
	  True))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
		(right (right-branch mobile)))
	(and (branch-balance? left)
		 (branch-balance? right)
		 (= (moment left) (moment right)))))
		 
