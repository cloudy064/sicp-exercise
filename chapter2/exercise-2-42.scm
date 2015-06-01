(load "public.scm")
(load "../chapter1/public.scm")

(define (display-queens result)
  (define (display-solution solution)
	(display solution)
	(newline))
  (define (display-queens-iter rest)
	(cond ((null? rest) (newline))
		  (else (display-solution (car result))
				(display-queens-iter (cdr rest)))))
  (display (length result))
  (display " solutions in all")
  (newline)
  (display-queens-iter result))

(define (queens board-size)
  (define (queen-cols k)
	(if (= k 0)
		(list empty-board)
		(filter
		 (lambda (positions) (safe? k positions))
		 (flatmap
		  (lambda (rest-of-queens)
			(map (lambda (new-row)
				   (adjoin-position new-row k rest-of-queens))
				 (enumerate-interval 1 board-size)))
		  (queen-cols (- k 1))))))
  (queen-cols board-size))

;; Just notice here that, the positions we generate are inverted.
;; So, when we test the safety of positions, we just pick the first element of the list as the k-th column position.
(define (adjoin-position row col rest-of-queens)
  (cons (list col row) rest-of-queens))

(define (safe? k positions)
  (if (null? positions)
	  #t
	  (let ((check-col (car positions))
			(rest-cols (cdr positions)))
		(define (safe-iter rest)
		  (if (null? rest)
			  #t
			  (and (/= (+ (car check-col) (cadr check-col))
					   (+ (car (car rest)) (cadr (car rest))))
				   (/= (- (car check-col) (cadr check-col))
					   (- (car (car rest)) (cadr (car rest))))
				   (/= (cadr check-col) (cadr (car rest)))
				   (safe-iter (cdr rest)))))
		(safe-iter rest-cols))))

(define empty-board ())

;; I don't know the unequal symbol.
;; So, I just define that here.
(define (/= first second)
  (not (= first second)))
