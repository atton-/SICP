;1.38な無限連分数……だけど調子悪いので
;http://www.billthelizard.com/2010/07/sicp-137-138-and-139-continued.html
;な感じにちょっと修正

(define (cont-frac n d k)
  (define (iter i result)
	(if (= i 0)
	  result
	  (iter (- i 1)
			(/ (n i)
			   (+ result (d i))))))
  (iter (- k 1) (/ (n k) (d k))))

(define (tan-cf x k)
  (define (n k) (if (= k 1) x (- (* x x))))
  (define (d k) (- (* 2 k) 1))
  (cont-frac n d k))

(use math.const)

(exact->inexact (tan-cf (/ pi 6) 5))
(exact->inexact (tan-cf (/ pi 6) 10))
(exact->inexact (tan-cf (/ pi 4) 5))
(exact->inexact (tan-cf (/ pi 4) 10))

;gosh> 0.5773502690823613
;gosh> 0.5773502691896257
;gosh> 0.999999986526355
;gosh> 1.0
