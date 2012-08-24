;2.4なconsとcarとcdrの自前定義
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define a (cons 1 2))
(car a)
(cdr a)
;gosh> 1
;gosh> 2

(define b (cons 3 4))
(car b)
(cdr b)
;gosh> 3
;gosh> 4

;なんで動くか？
;
;cons はxとy を取って、"mを取って、xとyをmに渡す手続き"を返す
;car は zを取って、"pとqを取ってpを返す手続き"をzに対して作用させる
;
;ので(cons 1 2) で x=1,y=2な(lambda (m) (m 1 2))となる
;carはzを取って(z (lambda (p q) p))するので
;(cons 1 2)を渡すと
;((cons 1 2) (lambda (p q) p))
;((lambda (m) (m 1 2)) (lambda (p q) p))
;((lambda (p q) p) 1 2)
;1
;
;となる。cdrも流れは基本同じ。
