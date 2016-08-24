;========================================
;;; Looping
;========================================

;========================================
;Recursion

;A recursive function is a function that calls itself in its definition. Even it may sound strange, it is a usual way for looping. If you have an analogy comparing functions to machines, recursion makes no sense. As the function is, however, a procedure, it makes sense to call itself. For instance, let's consider literature survey. You may need to read the literatures (cited-1) that are cited in the literature you are reading now. Again, you may need to read other literatures cited in the cited-1. Thus, literature survey is a recursive process and you can repeat surveying until satisfying a certain condition (say, you are tired). Thus, an analogy that compares functions in programming languages to some kind of human activities (say, literature survey) is useful to understand recursive functions.

;Calculating factorial is often used to explain recursion.

(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

;(fact 5) is calculated like as follows:

(fact 5)
;⇒ 5 * (fact 4)
;⇒ 5 * 4 * (fact 3)
;⇒ 5 * 4 * 3 * (fact 2)
;⇒ 5 * 4 * 3 * 2 * (fact 1)
;⇒ 5 * 4 * 3 * 2 * 1
;⇒ 5 * 4 * 3 * 2
;⇒ 5 * 4 * 6
;⇒ 5 * 24
;⇒ 120

;However, recursive functions can express repetition in a simple manner. Further as lists are defined recursively, lists and recursive functions fit together. For instance, a function that makes all list items twice is defined like as follows. The function should return an empty list if the argument is an empty list to terminate the calculation.

(define (list*2 ls)
  (if (null? ls)
      '()
      (cons (* 2 (car ls))
	    (list*2 (cdr ls)))))

;========================================
;Tail Recursive

;Ordinary recursive function is not efficient because of wasting memory and function call overhead. On the contrary, tail recursive functions include the result as argument and returns it directory when the calculation finishes. Especially, as Scheme specification requires conversion of a tail recursive to a loop, there is no function call overhead.

;[code 2] shows a tail recursive version of function fact shown in [code 1].

;[code 2] fact-tail, tail recursive version of fact

(define (fact-tail n)
  (fact-rec n n))

(define (fact-rec n p)
  (if (= n 1)
      p
      (let ((m (- n 1)))
	(fact-rec m (* p m)))))

;fact-tail calculates factorial like as follows:

(fact-tail 5)
;⇒ (fact-rec 5 5)
;⇒ (fact-rec 4 20)
;⇒ (fact-rec 3 60)
;⇒ (fact-rec 2 120)
;⇒ (fact-rec 1 120)
;⇒ 120

;As fact-rec does not wait the result of other functions, it disappears from the memory space when it finishes. The calculation proceeds by changing argument of fact-rec, which is basically the same as loop. As mentioned previously, as Scheme convert a tail recursive to a loop, Scheme can do repetition without syntax for looping.

;========================================
;Named let

;The named let is available to express loop. [code 3] shows a function fact-let that calculates factorials using named let. The fact-let uses a named let expression (loop), instead of fact-rec shown in [code 2]. First it initializes parameters (n1, p) with n at the line marked with ; 1. These parameters are updated at the line marked with ; 2 after each cycle: Subtracting n1 by one and multiplying p by (n1-1)
;A named let is a conventional way to express loops in Scheme.

;[code 3]

(define (fact-let n)
  (let loop((n1 n) (p n))     ; 1
    (if (= n1 1)                    
	p
	(let ((m (- n1 1)))
	  (loop m (* p m))))))      ; 2

;========================================
;letrec

;While it is similar to the named let, a name defined by letrec can refer itself in its definition. The letrec syntax is used to define complicated recursive functions. [code 4] shows a letrec version of fact.

;[code 4]

(define (fact-letrec n)
  (letrec ((iter (lambda (n1 p)
		   (if (= n1 1)
		       p
		       (let ((m (- n1 1)))
			 (iter m (* p m)))))))     ; *
    (iter n n)))

;As shown at the line of ; *, the local variable iter can refer itself in the definition of iter. Syntax letrec is a conventional way to define local functions.



