(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

;newton.scm
(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

;無限ループっぽい
;
;教えてもらったまとめ
;ifが手続きだと、作用的に評価しようとする。
;(if true-false A B)だとすると、AとBを頑張って求めようとする。
;sqrt-iterではifを終了条件に使用している。
;なので、(define (hoge a b) (new-if a (hoge a b)))だと、hogeを永遠に求め続ける。
;ifの条件部分だけは正規的なアレっぽい。そういう意味でifは特殊な形式らしい。
