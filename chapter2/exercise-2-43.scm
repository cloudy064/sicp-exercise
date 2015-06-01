(load "exercise-2-42.scm")

;; The function slow-queens will generate (queen-cols (- k 1) for each number in (enumerate-interval 1 board-size, while the function queens just generate that once.
(define (slow-queens board-size)
  (define (queen-cols k)
	(if (= k 0)
		(list empty-board)
		(filter
		 (lambda (positions) (safe? k positions))
		 (flatmap
		  (lambda (new-row)
			(map (lambda (rest-of-queens)
				   (adjoin-position new-row k rest-of-queens))
				 (queen-cols (- k 1))))
		  (enumerate-interval 1 board-size))
  (queen-cols board-size))
