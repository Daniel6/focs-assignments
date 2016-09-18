#lang racket

;;; Student Name: Daniel Bishop
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

(define operators
  (list
    (list 'ADD +)
    (list 'MUL *)
    (list 'DIV /)
    (list 'SUB -)
    (list 'GT >)
    (list 'LT <)
    (list 'GE >=)
    (list 'EQ =)
    (list 'LE <=)
    (list 'NEQ 
      (lambda (a b) (not (= a b)))
    )
    (list 'AND 
      (lambda (a b) (and a b))
    )
    (list 'OR 
      (lambda (a b) (or a b))
    )
    (list 'IPH 
      (lambda (a b c) (if a b c))
    )
    (list 'NOT not)
  )
)

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish") (newline)
  (repl empty)
)

(define (repl env)
  (display "> ")
  (display (my-eval (read) env))
  (newline)
  (repl env)
)

(define (my-eval x env)
  (cond
    [(null? x) x]
    [(number? x) x]
    [(boolean? x) x]
    [(symbol? x) (first (rest (assq x env)))]
    [else
      (case (first x)
        [(DEFINE) 
          (repl (append env (list (cons (first (rest x)) (cons (my-eval (first (rest (rest x))) env) empty)))))
        ]
        [else
          (if (list? (first x))
            (when (eq? (first (first x)) 'LAMBDA)
              (eval-lambda (first x) (rest x) env)
            )
            (apply
              (first (rest (assq (first x) operators)))
              (map (lambda (a) (my-eval a env)) (rest x))
            )
          )
        ]
      )
    ]
  )
)

(define (eval-lambda x args env)
  (my-eval (first (rest (rest x))) (append (pollute-env (first (rest x)) args env) env))
)

(define (pollute-env names args env)
  (if (null? names)
    empty
    (append (list (list (first names) (my-eval (first args) env))) (pollute-env (rest names) (rest args) env))
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
 