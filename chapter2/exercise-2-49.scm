(load "exercise-2-46.scm")
(load "exercise-2-47.scm")
(load "exercise-2-48.scm")

(define (segments->painter segment-list)
  (lambda (frame)
	(for-each
	 (lambda (segment)
	   (draw-line
		((frame-coord-map frame) (start-segment segment))
		((frame-coord-map frame) (end-segment segment))))
	 segment-list)))

;; Oh my god!
