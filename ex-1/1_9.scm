(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus-one a b)
  (if (= a 0)
    b
    (inc (plus-one (dec a) b))))
(plus-one 4 5)

;(plus-one 4 5)
;(inc (plus-one (dec 4) 5))
;(inc (plus-one 3 5))
;(inc (inc (plus-one (dec 3) 5)))
;(inc (inc (plus-one 2 5)))
;(inc (inc (inc (plus-one (dec 2) 5))))
;(inc (inc (inc (plus-one 1 5))))
;(inc (inc (inc (inc (plus-one (dec 1) 5)))))
;(inc (inc (inc (inc (plus-one 0 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;=>9

(define (plus-two a b)
  (if (= a 0)
    b
    (plus-two (dec a) (inc b))))
(plus-two 4 5)

;(plus-two 4 5)
;(plus-two (dec 4) (inc 5))
;(plus-two 3 6)
;(plus-two (dec 3) (inc 6))
;(plus-two 2 7)
;(plus-two (dec 2) (inc 7))
;(plus-two 1 8)
;(plus-two (dec 1) (inc 8))
;(plus-two 0 9)
;=>9
