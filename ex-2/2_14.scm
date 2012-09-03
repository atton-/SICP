;2.14,15,16 をまとめて

;2.14な計算法を変えると異なる結果になる問題

;2.7とかの区間演算
(define (make-interval a b) (cons a b))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4)
				   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
				(make-interval (/ 1.0 (upper-bound y))
							   (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				 (- (upper-bound x) (lower-bound y))))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


;2.12 な中央値と相対誤差を指定して区間を作成するmake-center-percent
(define (make-center-percent center percent)
  (if (> center 0)
	(make-interval (- center (* center percent))
				   (+ center (* center percent)))
	(make-interval (+ center (* center percent))
				   (- center (* center percent)))))
(define (width interval)
  (/ (- (lower-bound interval) (upper-bound interval)) 2))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (percent interval)
  (/ (abs (- (upper-bound interval) (center interval)))
	 (center interval)))

;2.14な部分

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
				(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
	(div-interval one
				  (add-interval (div-interval one r1)
								(div-interval one r2)))))

(define A (make-interval 10 20))
(define B (make-interval 15 25))

(par1 A A)
(par2 A A)
(par1 A B)
(par2 A B)
;gosh> (2.5 . 20.0)
;gosh> (5.0 . 10.0)
;gosh> (3.3333333333333335 . 20.0)
;gosh> (5.999999999999999 . 11.11111111111111)


(define PA (make-center-percent 10 0.1))
(define PB (make-center-percent 15 0.01))

(par1 PA PA)
(par2 PA PA)
(par1 PA PB)
(par2 PA PB)
;gosh> (3.681818181818182 . 6.722222222222221)
;gosh> (4.5 . 5.5)
;gosh> (5.1108986615678775 . 6.987421383647798)
;gosh> (5.60377358490566 . 6.372848948374761)

;値はだいぶ変わってるみたい



;参考 : http://swatmac.info/?p=604

;どうやら私の percent の定義がおかしい様子
(define (percent interval)
  (/ (width interval) (abs (center interval))))
;あと、lower-boundとupper-boundを、必ず大きいか小さい方を返すようにした方が良い感じっぽい
(define (lower-bound interval) (max (car interval) (cdr interval)))
(define (upper-bound interval) (min (car interval) (cdr interval)))

;percentで、演算後の誤差がどれだけ変わるか見てみると

(define A (make-center-percent 100 0.1))
(define B (make-center-percent 150 0.1))

(percent (add-interval A B))
(percent (sub-interval A B))
(percent (mul-interval A B))
(percent (div-interval A B))
;gosh> 0.1
;gosh> 0.5
;gosh> 0.19801980198019803
;gosh> 0.19801980198019808

;今回、add-interval は誤差が無いけど、それ以外のは誤差が増えてる

;あと、逆数にするだけなら誤差はあんまり無いみたい
(percent (div-interval (make-interval 1 1) A))
(percent (div-interval (make-interval 1 1) B))
;gosh> 0.10000000000000005
;gosh> 0.10000000000000002


;2.15な部分

;par2の方がpar1より優れている理由

;par1は加算と乗算と除算で構成されていて
;par2は逆数と加算で構成されている

;2.14の結果から
; 誤差が増える演算   : 減算,乗算,除算
; 誤差が増えない演算 : 加算,逆数
;なので、par2の方が誤差が少ない


;2.16な部分

;2.9の時に、加算減算は引数の幅にだけ関係してる関数、みたいなのがあったので、
;相対誤差だけの関数になってるもので構成できれば良いのかな。

;今回だと加算と逆数にする演算のみで構成するとか？
;一応、できるのかは分からない。

;区間同士の演算をする時、両区間の最小公倍数の逆数とかをかけて、1/??みたいな数値にするとか？
;この問題で言う、R1R2でR1とR2を割ってる、みたいな。

;あと、割る時に区間どうしを直接演算するんじゃなくて、加算と逆数の演算になるように間に何か挟むとか？
