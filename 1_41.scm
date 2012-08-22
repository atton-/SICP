;1.41な手続きを二回作用させる手続きを返すdouble

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

((double inc) 3)

(((double (double double)) inc) 5)


;(((double (double double)) inc) 5)
;(((2回作用 (2回作用 2回作用)) inc) 5)
;(((2回作用 4回作用) inc) 5)
;((16回作用 inc) 5)
;(16回inc 5)
;21

;(double f)はfを二回作用させる、なので
;(2回作用 4回作用) は (4回作用 (4回作用 x)) になって16回になってる
