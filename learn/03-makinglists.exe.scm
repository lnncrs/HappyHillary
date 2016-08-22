;Exercise 1
;Make data structures using cons that the front end responds like as follows.
;("hi" . "everybody")
;(0)
;(1 10 . 100)
;(1 10 100)
;(#\I "saw" 3 "girls")
;("Sum of" (1 2 3 4) "is" 10)

(cons "hi" "everybory")
(cons 0 '())
(cons (cons 1 (cons 10 '())) 100)
(cons 1 (cons 10 (cons 100 '())))
(cons #\I (cons "saw" (cons 3 (cons "girls" '()))))
(cdr (cons '(1 10) 100))

;Exercise 2
;Evaluated following S-expressions.
(car '(0))
(cdr '(0))
(car '((1 2 3) (4 5 6)))
(cdr '(1 2 3 . 4))
(cdr (cons 3 (cons 2 (cons 1 '()))))

(cdr (cdr (cdr (cdr (list 1 2 3 4)))))