#lang racket

;;; Student Name: Daniel Bishop
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from the joey
;;;     and/or using these external resources: piazza

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define (assq k l)
	(if (null? l)
		#f
		(if (list? (first l))
			(if (eq? k (first (first l)))
				(first l)
				(assq k (rest l))
			)
			#f
		)
	)
)

(display (assq 'z '((x 3) (y 12) (z 2)))) (newline)

;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define operator-list
	(list (list 'ADD +)
		  (list 'SUB -)
		  (list 'MUL *)
		  (list 'DIV /)
		  (list 'GT >)
		  (list 'LT <)
		  (list 'GE >=)
		  (list 'LE <=)
		  (list 'EQ =)
		  (list 'NEQ (lambda (x y) (not (= x y))))
		  (list 'ANND (lambda (x y) (and x y)))
		  (list 'ORR (lambda (x y) (or x y)))
		  (list 'NOTT not)))

(define (evaluate func args)
  (if (number? func)
    func
    (if (boolean? func)
      func
      (if (symbol? func)
        (first (rest (assq func args)))
        (case (first func)
          [(ADD) (+ (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(SUB) (- (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(MUL) (* (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(DIV) (/ (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(LT) (< (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(GT) (> (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(LE) (<= (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(GE) (>= (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(EQ) (= (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(NEQ) (not (= (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args)))]
          [(AND) (and (evaluate (first (rest func)) args) (evaluate (first (rest (rest func))) args))]
          [(OR) (or (evaluate (first (rest func))) (evaluate (first (rest (rest func)))))]
          [(NOT) (not (evaluate (first (rest func)) args))]
          [(IPH) (if (evaluate (first (rest func)) args)
            (evaluate (first (rest (rest func))) args)
            (evaluate (first (rest (rest (rest func)))) args)
          )]
        )
      )
    )
  )
)

(display (evaluate '(ADD x y) '((x 3) (y 2) (z -5)))) (newline)
(display (evaluate '(IPH (GT x 0) x (SUB 0 x)) '((x 3) (y 2) (z -5)))) (newline)
(display (evaluate 'y  '((x 3) (y 2) (z -5)))) (newline)
(display (evaluate '(IPH (GT z 0) z (SUB 0 z)) '((x 3) (y 2) (z -5)))) (newline)
