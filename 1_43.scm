;1.43なn回fを作用させる repeated

(define (repeated f n)
  (if (= n 1) 
	(lambda (x) (f x))
	(compose f (repeated f (- n 1)))))

;1.42なcompose
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

((repeated (lambda (x) (* x x)) 2) 5)
((repeated (lambda (x) (* x x)) 3) 5)
;gosh> 625
;gosh> 390625

;参考 http://www.serendip.ws/archives/479
