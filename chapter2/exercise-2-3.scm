(load "exercise-2-2.scm")

;;Maybe, you should make sure that two segments are perpendicular.
(define (make-rectangle-1 segment-w segment-h)
  (cons segment-w segment-h))

(define (segment-length segment)
  (let ((x-diff (- (x-point (start-segment segment))
				   (x-point (end-segment segment))))
		(y-diff (- (y-point (start-segment segment))
				   (y-point (end-segment segment)))))
	(sqrt (+ (square x-diff) (square y-diff)))))

(define (rectangle-width r) (segment-length (car r)))

(define (rectangle-height r) (segment-length (cdr r)))

;;Below are the functions for rectangle.
(define (rectangle-area r)
  (* (rectangle-width r) (rectangle-height r)))

(define (rectangle-perimeter r)
  (* 2 (+ (rectangle-width r) (rectangle-height r))))
