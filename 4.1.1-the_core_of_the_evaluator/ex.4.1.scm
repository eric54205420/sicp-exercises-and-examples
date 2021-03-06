;; Notice that we cannot tell whether the metacircular evaluator evaluates operands
;; from left to right or from right to left. Its evaluation order is inherited from
;; the underlying Lisp: If the arguments to cons in list-of-values are evaluated from
;; left to right, then list-of-values will evaluate operands from left to right; and
;; if the arguments to cons are evaluated from right to left, then list-of-values will
;; evaluate operands from right to left.

;; Write a version of list of values that evaluates operands from left to right
;; regardless of the order of evaluation in the underlying Lisp. Also write a version of
;; list-of-values that evaluates operands from right to left.

(define (list-of-values-ltr exp env)
  (if (no-operands? exps)
      '()
      (let* ((left (eval (first-operands exps) env))
             (right (eval (rest-operands exps) env)))
        (cons left right))))

(define (list-of-values-rtl exp env)
  (if (no-operands? exps)
      '()
      (let* ((left (eval (first-operands exps) env))
             (right (eval (rest-operands exps) env)))
        (cons right left))))
