(load "exercise-1-42.scm")

(define (repeated g n)
  (define (next-func func) (compose g func))
  (define (repeated-iter count func)
	(if (= count n) func
		(repeated-iter (+ count 1) (next-func func))))
  (repeated-iter 1 g))

;;可以用折半的方法
(define (repeated2 g n)
  (define (repeated2-iter func k)
	(cond ((= k 0) func)
		  ((even? k) (repeated2-iter (compose func func) (/ k 2)))
		  (else (repeated2-iter (compose g func) (- k 1)))))
  (repeated2-iter g (- n 1)))

;;如果你追求完美的话
;;上面可以再加一个当n＝0的时候的情况,如下
(define (repeated3 g n)
  (define (repeated3-iter func k)
	(cond ((= k 0) func)
		  ((even? k) (repeated3-iter (compose func func) (/ k 2)))
		  (else (repeated3-iter (compose g func) (- k 1)))))
  (if (= n 0) (lambda (x) x)
	  (repeated3-iter g (- n 1))))
