;========================================
;;; Using Scheme as a Calculator
;========================================

;========================================
;Four Basic Arithmetic Operations

;Scheme (and most of Lisp) can treat fractional numbers. Function exact->inexact is to convert from fractional numbers to floating point numbers. Scheme can also treat complex numbers. Complex numbers are represented by a+bi, where a and b are real and imaginary parts. +, -, *, and / represent addition, subtraction, multiplication, and division, respectively. These functions accept arbitrary numbers of arguments.

(- 10 3) ;⇒ 7
(- 10 3 5) ;⇒ 2
(* 2 3) ;⇒ 6
(* 2 3 4) ;⇒ 24
(/ 29 3) ;⇒ 29/3
(/ 29 3 7) ;⇒ 29/21
(/ 9 6) ;⇒ 3/2
(exact->inexact (/ 29 3 7)) ;⇒ 1.380952380952381

;Parentheses can be nested like as follows:

(* (+ 2 3) (- 5 3)) ;⇒ 10
(/ (+ 9 1) (+ 2 3)) ;⇒ 2

;========================================
;Quotient, remainder, modulo, and sqrt

;Function quotient is to get quotient.
;Functions remainder and modulo are to get remainder.
;Function sqrt is to get the square root of the argument.

(quotient 7 3) ;⇒ 2
(modulo 7 3) ;⇒ 1
(sqrt 8) ;⇒ 2.8284271247461903

;========================================
;Trigonometric Functions. Functions sin, cos, tan, asin, acos, and atan are available

;Functions sin, cos, tan, asin, acos, and atan are available. atan accepts one or two arguments. if the value of atan is expected to be 1/2 π, use two arguments.

(atan 1) ;⇒ 0.7853981633974483
(atan 1 0) ;⇒ 1.5707963267948966

;========================================
;Exponential and Logarithm

;Exponential and logarithm are calculated by exp, and log, respectively. The value of b to the power of a can be calculated by (expt a b).

(expt 3 2)
