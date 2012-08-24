;2.6なChurch数

(define zero  (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;http://www23.atwiki.jp/selflearn/pages/16.html#id_e78ae615
;とか参考にしてみる。
;http://blog.livedoor.jp/dankogai/archives/50458503.html
;によると「要は、ある数は、ある関数fを何回xに適用するか、という定義にしてしまうのである」らしい

(define (inc x) (+ x 1))
((zero inc) 0)
(((add-1 zero) inc) 0)
(((add-1 (add-1 zero)) inc) 0)
(((add-1 (add-1 (add-1 zero))) inc) 0)
;gosh> 0
;gosh> 1
;gosh> 2
;gosh> 3

;oneの定義 : (add-1 zero)の展開
(define one (lambda (f) (lambda (x) (f x))))

;twoの定義 : (add-1 one)の展開
(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))

((zero inc) 0)
((one inc) 0)
((two inc) 0)
((three inc) 0)
;gosh> 0
;gosh> 1
;gosh> 2
;gosh> 3

;(add-1 zero)の展開
;  
;から
;(add-1 zero)は
;(lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) y)) f) x))))
;になる。(区別のためにzeroのfはgへ。zeroのxはyに置換)
;これを展開していくと
;(lambda (f) (lambda (x) (f ((lambda (y) y) x))))
;(lambda (f) (lambda (x) (f x)))
;になる


;加算。
;(a f)を作用させたxに(b f)を作用させる
(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))

(((add one two) inc) 0)
(((add three two) inc) 0)
;gosh> 3
;gosh> 5
