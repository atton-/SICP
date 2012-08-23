;1.24 なfermatテスト
(use srfi-19)
(use srfi-27)

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
	(= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else #f)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (remainder (square (expmod base (/ exp 2) m)) m))
		(else
		  (remainder (* base (expmod base (- exp 1) m)) m))))

;1.21な素数判定
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


;Carmichel数。fermatテストだと素数判定になる
(display "fermat")
(fast-prime?  561 10)
(fast-prime? 1105 10)
(fast-prime? 1729 10)
(fast-prime? 2465 10)
(fast-prime? 2821 10)

;素数判定だと素数じゃないと判定される
(display "prime")
(prime?  561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)


;1.27なテスト
(define (test-iter n c)
  (cond ((= n c) #t)
		((= (expmod n c c) n) (test-iter (+ n 1) c))
		(else #f)))

(define (test num)
  (test-iter 1 num))
  
;Carmichel数は全部通る
(display "test")
(test  561)
(test 1105)
(test 1729)
(test 2465)
(test 2821)

;参考 : http://swatmac.info/?p=478
