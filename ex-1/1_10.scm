(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)


(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

;f
(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
;f(0) = 0
;f(n) = 2n

;g
(g 0)
(g 1)
(g 2)
(g 3)
(g 4)
(g 5)
;g(0) = 0
;g(n) = 2^n

;h
(h 0)
(h 1)
(h 2)
(h 3)
(h 4)
(h 5)
;h(n) = 2^h(n-1) 
;h(0) = 0
;
;http://ja.wikipedia.org/wiki/テトレーション
;h(0) = 0
;によれば
;h(n) = 2↑↑n
