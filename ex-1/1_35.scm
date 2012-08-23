;1.35な不動点探索

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

;cosの不動点を求めてみる
(fixed-point cos 1.0)

;平方根をこっちで再定義する
;averageとっておかないと収束しないらしい
(define (average x y) (/ (+ x y) 2.0))
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
			   1.0))
(sqrt 100)

;1.35 な黄金比の計算
(fixed-point (lambda (x) (+ 1(/ 1.0 x))) 1)
