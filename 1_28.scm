;1.24 なfermat-test
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

(display "fermat-test only")
(display "Cirmichel-number")
(fast-prime?  561 10)
(fast-prime? 1105 10)
(fast-prime? 1729 10)
(fast-prime? 2465 10)
(fast-prime? 2821 10)
(display "prime-number")
(fast-prime?    1009 10)
(fast-prime?    1013 10)
(fast-prime?    1019 10)
(fast-prime?   10007 10)
(fast-prime?   10009 10)
(fast-prime?   10037 10)
(fast-prime?  100003 10)
(fast-prime?  100019 10)
(fast-prime?  100043 10)
(fast-prime? 1000003 10)
(fast-prime? 1000033 10)
(fast-prime? 1000037 10)


;1.28なmiller-rabin-test
(define (miller-rabin-test x n)
  (and (not (= x 1))
	   (not (= x (- n 1)))
	   (= (remainder (square x) n) 1)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (if (miller-rabin-test (expmod base (/ exp 2) m) m)
		   0
		   (remainder (square (expmod base (/ exp 2) m)) m)))
		(else
		  (remainder (* base (expmod base (- exp 1) m)) m))))

(display "fermat-test use miller-rabin-test")
(display "Cirmichel-number")
(fast-prime?  561 10)
(fast-prime? 1105 10)
(fast-prime? 1729 10)
(fast-prime? 2465 10)
(fast-prime? 2821 10)
(display "prime-number")
(fast-prime?    1009 10)
(fast-prime?    1013 10)
(fast-prime?    1019 10)
(fast-prime?   10007 10)
(fast-prime?   10009 10)
(fast-prime?   10037 10)
(fast-prime?  100003 10)
(fast-prime?  100019 10)
(fast-prime?  100043 10)
(fast-prime? 1000003 10)
(fast-prime? 1000033 10)
(fast-prime? 1000037 10)

;参考までに1.21なprime?でも実行
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

(display "prime-test use smallest-divisor")
(display "Cirmichel-number")
(prime?  561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(display "prime-number")
(prime?    1009)
(prime?    1013)
(prime?    1019)
(prime?   10007)
(prime?   10009)
(prime?   10037)
(prime?  100003)
(prime?  100019)
(prime?  100043)
(prime? 1000003)
(prime? 1000033)
(prime? 1000037)

;参考 : http://d.hatena.ne.jp/awacio/20100225/1267107718
;       http://www.billthelizard.com/2010/03/sicp-exercise-128-miller-rabin-test.html
