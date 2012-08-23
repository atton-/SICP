;1.40 な x^3 + ax^2 + bx + c の零点を近似するcubicの定義

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

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
	(/ (- (g (+ x dx)) (g x))
	   dx)))

(define (newton-transform g)
  (lambda (x)
	(- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;a b cを渡すと、xを指定するだけで指定の式が返るlambdaを作ればokっぽい
(define (cubic a b c)
  (lambda (x)
	(+ (* x x x)
	   (* a x x)
	   (* b x)
	   c)))

(newtons-method (cubic 5 7 9) 1)
;gosh> -3.7776638108300093

;確認してみる
((cubic 5 7 9) -3.7776638108300093)
;gosh> 0.0
