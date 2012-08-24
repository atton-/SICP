;2.5な 2^a*3^bで表わせる数のconsとcarとcdr

(define (cons a b)
  (* (expt 2 a)
	 (expt 3 b)))

;2で割り続けられる回数を返す
(define (car x) 
  (define (iter y n)
	(if (and (= (remainder y 2) 0) (not (= y 0)))
	  (iter (/ y 2) (+ n 1))
	  n))
  (iter x 0))

;2で割り続けられる回数を返す
(define (cdr x) 
  (define (iter y n)
	(if (and (= (remainder y 3) 0) (not (= y 0)))
	  (iter (/ y 3) (+ n 1))
	  n))
  (iter x 0))


(define x (cons 0 0))
(car x)
(cdr x)
;gosh> 0
;gosh> 0

(define x (cons 3 0))
(car x)
(cdr x)
;gosh> 3
;gosh> 0

(define x (cons 0 5))
(car x)
(cdr x)
;gosh> 0
;gosh> 5

(define x (cons 3 5))
(car x)
(cdr x)
;gosh> 3
;gosh> 5
