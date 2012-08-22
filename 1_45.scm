;1.45なn乗根の近似

;平均緩和
(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

;1.35は不動点探索
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))

;1.43なrepeated
(define (repeated f n)
  (if (= n 1) 
	f
	(compose f (repeated f (- n 1)))))
(define (compose f g)
  (lambda (x) (f (g x))))

;1.16なfast-expt

(define (fast-expt b n)
  (define (even? n) (= (remainder n 2) 0))
  (define (square n) (* n n))
  (cond ((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

;n乗根は何回の平均緩和が必要？

;1回
(define (n-root x n)
  (fixed-point (average-damp 
				 (lambda (y) (/ x (fast-expt y (- n 1)))))
			   1.0))


(n-root 100 2)
(n-root 1000 3)
;gosh> 10.0
;gosh> 10.000002544054729

;(n-root 10000 4)
;返ってこない

;http://wiki.drewhess.com/wiki/SICP_exercise_1.45
;するとlog_2(n)くらいらしいので

;log_2(n)回
(define (n-root x n)
  ;(fixed-point ((repeated average-damp (/ (log n) (log 2)))
  (fixed-point ((repeated average-damp 9)
				(lambda (y) (/ x (fast-expt y (- n 1)))))
			   1.0))
(n-root 100 2)
(n-root 1000 3)
(n-root 10000 4)
(n-root 100000 5)

(n-root 4 2)
(n-root 8 3)
(n-root 16 4)
(n-root 32 5)
