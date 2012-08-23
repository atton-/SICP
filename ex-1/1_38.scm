;1.37な無限連分数
;http://www.billthelizard.com/2010/07/sicp-137-138-and-139-continued.html
;を参考にちょっと変えてる。
;k→0な感じ。1.37だと0→kな感じだった。黄金比は求められたけど間違ってるかも。
(define (cont-frac n d k)
  (define (iter i result)
	(if (= i 0)
	  result
	  (iter (- i 1)
			(/ (n i)
			   (+ result (d i))))))
  (iter (- k 1) 0.0))

;指定された数列なdを定義
(define  (d i)
  (if (< i 3)
	i
	(if (= (remainder i 3) 2)
	  (+ (* 2 (quotient i 3)) 2)
	  1)))

;dがあってるか確認
(define (d-iter count)
  (if (= count 0)
	(display "fin")
	(begin
	  (display count)
	  (display ":")
	  (display (d count))
	  (newline)
	  (d-iter (- count 1)))))


(d-iter 20)

(+ 2 (cont-frac (lambda (i) 1.0) d 10))
(+ 2 (cont-frac (lambda (i) 1.0) d 300))
