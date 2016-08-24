;========================================
;;; Local variables
;========================================

;========================================
;let expression

;Local variables can be defined using the let expression. The format is like as follows:

;(let binds body)

;Declaring local variables i and j, binding them to 1 and 2 and then making a sum of them.

(let ((i 1) (j 2))
  (+ i j))
;Value: 3

;The let expressions can be nested.

;Making local variables i and j, binding them to 1 and i+2, and multiplying them.

(let ((i 1))
  (let ((j (+ i 2)))
    (* i j)))
;Value: 3

;As the scope of the variables is the body, The following code causes an error, because the variable i is not defined in the scope of the variable j.

(let ((i 1) (j (+ i 2)))
  (* i j))
;Error

;The let* expression is available to refer variables which is defined in the same binding form. Actually, the let* expression is a syntax sugar of nested let expressions.

(let* ((i 1) (j (+ i 2)))
  (* i j))
;Value: 3

;A function quadric-equation that calculates the answers of quadratic equations. 
;It takes three coefficient a, b, c (a x2 + b x + c = 0) as arguments and returns the list of answers in real numbers. The answers can be calculated without useless calculations by using let expressions step by step.

;;;The scopes of variables d,e, and f are the regions with the same background colors.

(define (quadric-equation a b c)
  (if (zero? a)      
      'error                                ; 1
      (let ((d (- (* b b) (* 4 a c))))      ; 2
	(if (negative? d)
	 '()                                      ; 3
	 (let ((e (/ b a -2)))                    ; 4
	   (if (zero? d)
	       (list e)
	       (let ((f (/ (sqrt d) a 2)))        ; 5
		 (list (+ e f) (- e f)))))))))

(quadric-equation 3 5 2)  ; solution of 3x2+5x+2=0
;Value 12: (-2/3 -1)

;The function behaves like as follows:
;*If the 2nd order coefficient (a) is 0, it returns 'error.
;*If a ≠ 0, it binds the value of the discriminant (b2 - 4ac) to a variable d.
;*If d is negative, it returns '().
;*If not, it binds -b/2a to a variable e.
;*If d is zero, it returns a list consisting e.
;*If d is positive, it binds √(d/2a) to a variable f and returns a list of (+ e f) and (- e f).
