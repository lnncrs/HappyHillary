;Exercise 1
;Calculate followings using Scheme interpreter.
;(1+39) * (53-45)
;(1020 / 39) + (45 * 2)
;Sum of 39, 48, 72, 23, and 91
;Average of 39, 48, 72, 23, and 91 as a floating point.

(* (+ 1 39) (- 53 45))
(+ (/ 1020 39) (* 45 2))
(+ 39 48 72 23 91)
(exact->inexact (/ (+ 39 48 72 23 91) 4))

;Exercise 2
;Calculate following values using Scheme interpreter.
;circle ratio, π
;exp(2/3)
;3 to the power of 4
;logarithm of 1000

(* 4 (atan 1))
(exp (/ 2 3))
(expt 3 4)
(log 1000)
