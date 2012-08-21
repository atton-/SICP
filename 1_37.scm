;1.37な無限連分数
;反復的
(define (cont-frac n d k)
  (define (iter i result)
	(if (= i k)
	  result
	  (iter (+ i 1)
			(/ (n i)
			   (+ result (d i))))))
  (iter 0 0.0))

(cont-frac (lambda (i) 1.0)
		   (lambda (i) 1.0)
		   5)
;gosh> 0.6180339850173578


;4桁の精度にどのくらい必要なのかkを増やしながら実行してみる
(define (cont-frac-with-status n d k)
  (define (iter i)
	(if (= i k)
	  (display "fin")
	  (begin
		(display "k=")
		(display i)
		(display " ")
		(display (cont-frac n d i))
		(newline)
		(iter (+ i 1)))))
  (iter 1))





(cont-frac-with-status (lambda (i) 1.0)
					   (lambda (i) 1.0)
					   20)
;k=1 1.0
;k=2 0.5
;k=3 0.6666666666666666
;k=4 0.6000000000000001
;k=5 0.625
;k=6 0.6153846153846154
;k=7 0.6190476190476191
;k=8 0.6176470588235294
;k=9 0.6181818181818182
;k=10 0.6179775280898876
;k=11 0.6180555555555556
;k=12 0.6180257510729613
;k=13 0.6180371352785146
;k=14 0.6180327868852459
;k=15 0.6180344478216819
;k=16 0.6180338134001252
;k=17 0.6180340557275542
;k=18 0.6180339631667064
;k=19 0.6180339985218034

;a. k=11 から4桁が6180で固定なので11。

;b. 再帰的な無限連分数
(define (cont-frac n d k)
  (if (= k 1)
	1.0
	(/ (n k)
	   (+ (d k)
		  (cont-frac n d (- k 1))))))

(cont-frac (lambda (i) 1.0)
		   (lambda (i) 1.0)
		   5)
