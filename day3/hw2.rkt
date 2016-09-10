#lang racket

;;; Student Name: Daniel Bishop
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from noone
;;;     and/or using these external resources: docs.racket-lang.org

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.

(define (calculate x)
  (if (number? x)
    x
    (if (boolean? x)
      x
      (case (first x)
        [(ADD) (+ (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(SUB) (- (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(MUL) (* (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(DIV) (/ (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(LT) (< (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(GT) (> (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(LE) (<= (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(GE) (>= (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(EQ) (= (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(NEQ) (not (= (calculate (first (rest x))) (calculate (first (rest (rest x))))))]
        [(AND) (and (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(OR) (or (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
        [(NOT) (not (calculate (first (rest x))))]
        [(IPH) (if (calculate (first (rest x)))
          (calculate (first (rest (rest x))))
          (calculate (first (rest (rest (rest x)))))
        )]
      )
    )
  )
)

(display (calculate '(ADD 3 4))) (newline) ;; --> 7

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(display (calculate '(ADD 3 (MUL 4 5)))) (newline) ;; --> 23   ;; what is the equivalent construction using list?
(display (calculate '(SUB (ADD 3 4) (MUL 5 6)))) (newline) ;; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

(display (calculate '(GT (ADD 3 4) (MUL 5 6)))) (newline) ;; --> #f
(display (calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) (newline) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

(display (calculate '(AND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))))) (newline) ;; --> #f
(display (calculate '(NOT (GT (SUB 10 2) (DIV 8 2))))) (newline) ;; --> #f
;;; 5. Add IPH

(display (calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3)))) (newline) ;; -> 4
(display (calculate '(IPH (LE (DIV 4 2) 3) (MUL 8 6) 0))) (newline) ;; --> 48