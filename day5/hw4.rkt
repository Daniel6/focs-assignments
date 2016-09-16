#lang racket

;;; Student Name: Daniel Bishop
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish") (newline)
  (repl empty)
)

(define (repl env)
  (display "> ")
  (display (evaluate (read) env))
  (newline)
  (repl env)
)

(define (evaluate x env)
  (if (number? x)
    x
    (if (boolean? x)
      x
      (if (symbol? x)
        (first (rest (assq x env)))
        (case (first x)
          [(ADD) (+ (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(SUB) (- (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(MUL) (* (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(DIV) (/ (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(LT) (< (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(GT) (> (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(LE) (<= (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(GE) (>= (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(EQ) (= (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(NEQ) (not (= (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env)))]
          [(AND) (and (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(OR) (or (evaluate (first (rest x)) env) (evaluate (first (rest (rest x))) env))]
          [(NOT) (not (evaluate (first (rest x))) env)]
          [(IPH) 
            (if (evaluate (first (rest x)) env)
              (evaluate (first (rest (rest x))) env)
              (evaluate (first (rest (rest (rest x)))) env)
            )
          ]
          [(DEFINE) 
            (repl (append env (list (cons (first (rest x)) (cons (evaluate (first (rest (rest x))) env) empty)))))
          ]
        )
      )
    )
  )
)

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
      (if (null? (first l))
        (assq k (rest l))
        (if (eq? k (first (first l)))
          (first l)
          (assq k (rest l))
        )
      )
      #f
    )
  )
)

(run-repl)
