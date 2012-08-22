;1.43なn回fを作用させる repeated

(define (repeated f n)
  (if (= n 1) 
	f
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
;こっちだと (= n 0) の時の式が
;f じゃなくて lambda (x) (f x) ってなってるけど意味的には同じぽさげ

(define (test f)
  (lambda (x) (f x)))
(define (test-2 f) f)

(square 3)
((test square) 3)
((test (test square)) 3)
((test-2 square) 3)
((test-2 (test-2 square)) 3)
;gosh> 9
;gosh> 9
;gosh> 9
;gosh> 9
;gosh> 9
