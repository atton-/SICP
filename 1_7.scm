;数が小さい場合
;例えば、0.0000001の平方根を取ると、0.001は大きすぎる値になってすぐに計算が終了していまう。
;
;数が大きい場合
;値が大きすぎると、0.001分の差が出てこなさそうなアレ


(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- guess
             (improve guess x)))
     0.0001))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))
(sqrt (square 1000000000))
(sqrt 0.004)
(sqrt (square 0.004))
