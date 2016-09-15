#lang racket

(define (list-length l)
	(foldl
		(lambda (elem cum) (+ cum 1))
		0
		l
	)
)

(display (list-length '())) (newline)
(display (list-length '(a))) (newline)
(display (list-length '(a b))) (newline)
(display (list-length '(a b a b))) (newline)

(define (count-evens l)
	(foldl
		(lambda (elem cum) 
			(if (even? elem)
				(+ cum 1)
				cum
			)
		)
		0
		l
	)
)

(display (count-evens '())) (newline)
(display (count-evens '(1))) (newline)
(display (count-evens '(1 2 3))) (newline)
(display (count-evens '(1 4 9 10 12))) (newline)

(define (list-square l)
	(map (lambda (x) (expt x 2)) l)
)

(display (list-square '(1 2 3))) (newline)
(display (list-square '(4 5 6))) (newline)

(define (list-add1 l)
	(map (lambda (x) (+ x 1)) l)
)

(display (list-add1 '(1 2 3))) (newline)

(define (list-add10 l)
	(map (lambda (x) (+ x 10)) l)
)

(display (list-add10 '(1 2 3))) (newline)

(define (list-addn n l)
	(map (lambda (x) (+ x n)) l)
)

(display (list-addn 100 '(1 2 3))) (newline)

(define (filter-even l)
	(filter even? l)
)

(display (filter-even '(1 2 3 4 5))) (newline)

(define (filter-positive l)
	(filter (lambda (x) (> x 0)) l)
)

(display (filter-positive '(-2 -1 0 1 2))) (newline)

(define (filter-gt n l)
	(filter (lambda (x) (> x n)) l)
)

(display (filter-gt 5 '(1 2 3 4 5 6 7 8 9 10))) (newline)
