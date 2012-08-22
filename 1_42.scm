;fとgの合成関数を返すcompose
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc) 6)
;gosh> 49
