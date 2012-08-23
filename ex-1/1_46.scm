;1.46な反復改良法
(define (iterative-improve good-enough? improve)
  (define (iter guess)
	(if (good-enough? guess) 
	  guess
	  (iter (improve guess))))
  iter)


;1.6のnewtonなsqrt
(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x)
			   x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt x)
  ((iterative-improve (lambda (guess) (good-enough? guess x))
					  (lambda (guess) (improve guess x)))
   1.0))

(sqrt 100)
(sqrt 4)


;1.35なfixed-point
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

(define (fixed-point f first-guess)
  ((iterative-improve 
	 (lambda (x) (< (abs (- x (f x))) 0.0001))
	 (lambda (x) (f x)))
   first-guess))

(fixed-point cos 1.0)
(fixed-point (lambda (x) (+ 1(/ 1.0 x))) 1)

;参考 : http://www.billthelizard.com/2010/08/sicp-146-iterative-improvement.html
