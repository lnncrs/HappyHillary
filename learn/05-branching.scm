;========================================
;;; Branching
;========================================

;========================================
;The if expression

;The if expression is to branch procedure into two parts. The format is like as follows:

;(if predicate then_value else_value)

(null? '())
;Value: #t

(null? '(a b c))
;Value: ()   ;#f

;Function not is available to negate predicates. This function takes exactly one argument and returns #t if the argument is #f otherwise #t.
;The if expression is a special form because it does not evaluate all arguments. If the predicate is true, only then_value is evaluated. On the other hand, if the predicate is false, only else_value is evaluated.

;Example: sum of geometric progression, whose first term, geometric ratio, and number of terms are a0, r, and n.

(define (sum-gp a0 r n)
  (* a0
     (if (= r 1)
	 n
	 (/ (- 1 (expt r n)) (- 1 r)))))   ; !!

;If the if expression evaluate all the arguments, the line commented with ; !! is evaluated even when r=1 and a devision by zero error occurs.
;You can omit the else_value term. In this case the returned value when the predicate is false is not specified. If you need #f when the predicate is false, you should write it explicitly.

;The then_value and else_value should be one S-expression. If you need side effects, you should use begin expression. I will mention about begin in a later chapter.

;========================================
;and and or

;The and and or are special forms to be used to combine conditions. Scheme's and and or are somehow different from those of conventional languages such as C. They do not return boolean (#t or #f) but returns one of given arguments. The and and or can makes your code shorter.

;and

(and #f 0)
;Value: ()

(and 1 2 3)
;Value: 3

(and 1 2 3 #f)
;Value: ()

;or

(or #f 0)
;Value: 0

(or 1 2 3)
;Value: 1

(or #f 1 2 3)
;Value: 1

(or #f #f #f)
;Value: ()

;========================================
;cond expression

;Even all branchings can be expressed by if expression, you should nest it if the branching has a wide variety, which makes code complicated. The cond expression is available for such cases. The format of the cond expression is like as follows:

;(cond
;  (predicate_1 clauses_1)
;  (predicate_2 clauses_2)
;    ......
;  (predicate_n clauses_n)
;  (else        clauses_else))

(define (fee age)
  (cond
   ((or (<= age 3) (>= age 65)) 0)
   ((<= 4 age 6) 0.5)
   ((<= 7 age 12) 1.0)
   ((<= 13 age 15) 1.5)
   ((<= 16 age 18) 1.8)
   (else 2.0)))

;========================================
;Functions that makes predicates

;eq?, eqv?, and equal?

;eq?

(define str "hello")
;Value: str

(eq? str str)
;Value: #t

(eq? "hello" "hello")
;Value: () ← It should be #f in R5RS 

;;; comparing numbers depends on implementations
(eq? 1 1)
;Value: #t

(eq? 1.0 1.0)
;Value: ()

;eqv?

(eqv? 1.0 1.0)
;Value: #t

(eqv? 1 1.0)
;Value: ()

;;; don't use it to compare sequences
(eqv? (list 1 2 3) (list 1 2 3))
;Value: ()

(eqv? "hello" "hello")
;Value: ()

;;; the following depends on implementations
(eqv? (lambda(x) x) (lambda (x) x))
;Value: ()

;equal?

(equal? (list 1 2 3) (list 1 2 3))
;Value: #t

(equal? "hello" "hello")
;Value: #t

;========================================
;Functions that check data type

;pair? ;It returns #t if the object consists of cons cells (or a cons cell).
;list? ;It returns #t if the object is a list. Be careful in that '() is a list but not a pair.
;null? ;It returns #t if the object is '().
;symbol? ;It returns #t if the object is a symbol.
;char? ;It returns #t if the object is a character.
;string? ;It returns #t if the object is a string.
;number? ;It returns #t if the object is a number.
;complex? ;It returns #t if the object is a complex number.
;real? ;It returns #t if the object is a real number
;rational? ;It returns #t if the object is a rational number.
;integer? ;It returns #t if the object is an integral
;exact? ;It returns #t if the object is not a floating point number.
;inexact? ;It returns #t if the object is a floating point number.

;========================================
;Functions that compare numbers
;=, <, >, <=, >=

(= 1 1 1.0)
;Value: #t

(< 1 2 3)
;Value: #t

(< 1)
;Value: #t

(<)
;Value: #t

(= 2 2 2)
;Value: #t

(< 2 3 3.1)
;Value: #t

(> 4 1 -0.2)
;Value: #t

(<= 1 1 1.1)
;Value: #t

(>= 2 1 1.0)
;Value: #t

(< 3 4 3.9)
;Value: ()

;odd?, even?, positive?, negative?, zero?

;========================================
;Functions that compare characters

;Functions char=?, char<?, char>?, char<=?, and char>=? are available to compare characters. See R5RS for detailed information.

;========================================
;Functions that compare strings

;Functions string=? and string-ci=? etc are available. See R5RS for detailed information.
