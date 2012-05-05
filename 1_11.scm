;再帰的プロセス
(define (f n)
  (if (< n 3)
	n
	(+ (f (- n 1))
	   (f (- n 2))
	   (f (- n 3)))))

(f 30)
