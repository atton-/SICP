;1.30 sumを反復的に実行できるように
(define (sum term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (+ result (term a)))))
  (iter a 0))


;整数の足し算
(define (inc x) (+ x 1))
(define (indentity x) x)

(define (sum-integers a b)
  (sum indentity a inc b))

(sum-integers 0 10)
(sum-integers 5 10)
;gosh> 55
;gosh> 45


;整数の3乗の積
(define (sum-cubes a b)
  (define (cube x) (* x x x))
  (sum cube a inc b))

(sum-cubes 1 10)
(sum-cubes 1 20)
;gosh> 3025
;gosh> 44100


;円周率の近似
(define (pi-sum a b)
  (define (pi-term x)
	(/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
	(+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))
(* 8 (pi-sum 1 10000))
;gosh> 3.139592655589782
;gosh> 3.141392653591789
