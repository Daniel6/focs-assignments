#lang racket

(define (tree-add1 tree)
	(if (null? (rest tree))
		(if (number? (first tree))
			(cons (+ (first tree) 1) '())
			(cons (tree-add1 (first tree)) '())
		)
		(if (number? (first tree))
			(cons (+ (first tree) 1) (tree-add1 (rest tree)))
			(cons (tree-add1 (first tree)) (tree-add1 (rest tree)))
		)
	)
)

(display (tree-add1 '(3 (1 4))))(newline)

(define (tree-max-depth tree)
	(if (null? (first tree))
		0 ; if first is null, then the tree is empty
		(if (null? (rest tree))
			1 ; if rest is null, then tree only has a first and so is depth 1
			(+ 1 (tree-max-depth (rest tree)))
		)
	)
)

(display (tree-max-depth '(3 (1 (4 1)) (5 (9 2)))))(newline)

(define (tree-max-width tree)
	
)