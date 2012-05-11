(use slib)
(require 'trace)

;再帰的プロセス
(define (f n)
  (if (< n 3)
	n
	(+ (f (- n 1))
	   (f (- n 2))
	   (f (- n 3)))))

;(trace f)
(f 30)



(define (f n)
  (define (f-iter count one two three)
	(if (= count n)
	  (if (< count 3)
		n
		(+ one two three))
	  (if (< count 3)
		(f-iter (+ count 1) count one two)
		(f-iter (+ count 1) (+ one two three) one two))))
  (f-iter 0 0 0 0))

;(trace f)
(f 30)
