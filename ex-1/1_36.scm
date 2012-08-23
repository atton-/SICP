;1.36な不動点探索。近似値を表示しながら実行する。
(define (fixed-point f first-guess)
  (define (average x y) (/ (+ x y) 2.0))
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(begin (display next) (newline) (try next)))))
  (try first-guess))

(fixed-point cos 1)

;x^x = 1000 の解を見つける

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
