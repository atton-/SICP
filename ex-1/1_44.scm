;1.44なsmooth
(define (smooth f)
  (define dx 0.00001)
  (define (average x y z) (/ (+ x y z) 3))
  (lambda (x)
	(average (f (+ x dx))
			 (f x)
			 (f (- x dx)))))

;1.43なn回fを作用させる repeated
(define (repeated f n)
  (if (= n 1) 
	f
	(compose f (repeated f (- n 1)))))
(define (compose f g)
  (lambda (x) (f (g x))))

(define (n-smooth f n)
  (repeated (smooth f) n))

(use math.const)

(sin pi)
((smooth sin) pi)
((n-smooth sin 5) pi)
;gosh> 1.2246467991473532e-16
;gosh> 1.2246402351402674e-16
;gosh> 1.2246402351402674e-16

(sin (/ pi 2))
((smooth sin) (/ pi 2))
((n-smooth sin 5) (/ pi 2))
;gosh> 1.0
;gosh> 0.9999999999666667
;gosh> 0.627571831978862

;実行テストは
;http://www.billthelizard.com/2010/08/sicp-144-smoothing-function.html
;を参考にしてみたけど、何がどのくらい有効なのかちょっと謎い
