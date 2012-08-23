;random は (use srfi-27) して random-integerに
;true は #t , faulse は #fに
;参考 : http://swatmac.info/?p=478

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


(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
	(report-prime (time-difference (current-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;12個テスト
(time-prime-test 1009)
(time-prime-test 1013)
(time-prime-test 1019)
(time-prime-test 10007)
(time-prime-test 10009)
(time-prime-test 10037)
(time-prime-test 100003)
(time-prime-test 100019)
(time-prime-test 100043)
(time-prime-test 1000003)
(time-prime-test 1000033)
(time-prime-test 1000037)


(define (prime-test num count)
  (if (= count 0)
	(display "fin")
	(begin (fast-prime? num 10)
		   (prime-test (+ num 1) (- count 1)))))

(define (report-prime-test start-time)
  (display (time-difference (current-time) start-time)))

(define (prime-test-with-time-inner num count start-time)
  (display num)
  (prime-test num count)
  (report-prime-test start-time))

(define (prime-test-with-time num count)
  (prime-test-with-time-inner num count (current-time)))

;1000個ずつ試してみる
(prime-test-with-time 1000 1000)
(prime-test-with-time 1000000 1000)

;実行結果
;<time-duration 0.009636000>
;<time-duration 0.013025000>

;fermatテストの計算量がlog(n)だとして、
;1000 = 10^3 , 1000000 = 10^6
;log(1000) = 3log(10) , log(1000000) = 6log(10)
;で二倍くらいを想定。
;実際1.5倍も無いので実行時間はそこまで増えてないので対数的っぽさげ
