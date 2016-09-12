#lang racket ; that's so racket

(define (factorial n)
	(if (= n 0)
		1
		(* n (factorial (- n 1)))
	)
)

(display (factorial 3)) (newline)

(define (my-filter op l)
	(if (null? l)
		empty
		(if (op (first l))
			(cons (first l) (my-filter op (rest l)))
			(my-filter op (rest l))
		)
	)
)

(display (my-filter even? '(1 2 3 4 5 6))) (newline)

(define (teen? x)
	(and (<= 13 x) (<= x 19))
)

(display (my-filter teen? '(21 17 2 13 4 42 2 16 3))) (newline)
(display (my-filter list? '(3 (3 2 1) symbol (4 2) (1 (2) 3)))) (newline)

(define (my-map op l)
	(if (null? l)
		empty
		(cons (op (first l)) (my-map op (rest l)))
	)
)

(define (double x)
	(* 2 x)
)

(define (incr x)
	(+ x 1)
)

(display (my-map double '(1 2 3))) (newline)
(display (my-map incr '(1 2 3))) (newline)

(define (my-append a b)
	(if (null? a)
		b
		(if (null? (rest a))
			(cons (first a) b)
			(cons (first a) (my-append (rest a) b))
		)
	)
)

(display (my-append '(1 2 3) '(4 5 6))) (newline)
(display (my-append empty '(4 5 6))) (newline)

(define (my-zip a b)
	(if (or (null? a) (null? b))
		empty
		(cons (list (first a) (first b)) (my-zip (rest a) (rest b)))
	)
)

(display (my-zip '(1 2 3) '(4 5 6))) (newline)
(display (my-zip '(1 2 3) '(a b c d e f g))) (newline)

(define (my-reverse l)
	(if (null? (rest l))
		(first l)
		(my-reverse-helper (rest l) (cons (first l) empty))
	)
)

(define (my-reverse-helper l h)
	(if (null? (rest l))
		(cons (first l) h)
		(my-reverse-helper (rest l) (cons (first l) h))
	)
)

(display (my-reverse '(1 2 3))) (newline)
(display (my-reverse '(1 2 3 4))) (newline)
(display (my-reverse '(1 2 3 4 5 6 7 8 9))) (newline)
