;letとlambdaな話をしてたら
;http://twitter.com/hanachin_/status/237714077814759424
;http://twitter.com/hanachin_/status/237714093908320257
;とかリプライがきたので

;letは
;(let (VARlIST) (BODY))な使い方
;http://twitter.com/gongoZ/status/237706699421659137

;let*だと定義した変数を他の変数の定義時に使える
(let* 
  ((a 1)
   (b (+ a 2))) 
  (+ a b))

;letだと、呼び出し元の変数を使うには、呼び出し元のexpなトコでletを呼ぶ必要が
(let 
  ((a 1))
  (let 
	((b (+ a 2)))
	(+ a b)))

;lambdaは
;defineの関数名が無くなったものをoperatorのトコに置く、みたいな使いかたっぽい
;((lambda (var) (func)) operand)みたいな？

((lambda (a)
   ((lambda (b) (+ a b))
	(+ a 1)))
 1)

;letとlambdaは関数を先に書くか変数を先に書くか、みたいな違いみたい 
