;========================================
;;; Higher Order Functions
;========================================

;Higher order functions are functions that takes functions as arguments. They are used for mapping, filtering, folding, and sorting of lists.
;The higher order functions promote modularity of programs. Writing higher order functions that are applicable in many cases makes program readable rather than writing recursive functions for individual cases.

;For instance, using a higher order function for sort allows sorting by variety of conditions, which separates the sorting condition and the sorting procedure sharply. The function sort takes two arguments, one is a list to be sorted and the other is an ordering function. The following shows the sort of a list of integral numbers in ascending order by their size. The function < is the ordering function of two numbers.

(sort '(7883 9099 6729 2828 7754 4179 5340 2644 2958 2239) <) ; ⇒ (2239 2644 2828 2958 4179 5340 6729 7754 7883 9099)
;On the other hand, sort by the size of last two digits can be done like as follows:

(sort '(7883 9099 6729 2828 7754 4179 5340 2644 2958 2239) 
       (lambda (x y) (< (modulo x 100) (modulo y 100))))      ; ⇒ (2828 6729 2239 5340 2644 7754 2958 4179 7883 9099)

;As shown here, sorting procedures such as quick sort, merge sort, etc. and ordering functions are separated completely, which promote reuse of codes.


;========================================
;Mapping

;Mapping is a procedure that treats all list items in a same manner. Two mapping functions are defined in the R5RS: One is map which returns the converted list and the other is for-each which is used for side effects.

; Adding each item of '(1 2 3) and '(4 5 6).
(map + '(1 2 3) '(4 5 6))
;⇒ (5 7 9)

; Squaring each item of '(1 2 3)
(map (lambda (x) (* x x)) '(1 2 3))
;⇒ (1 4 9)

;========================================
;Filtering

;Even filtering functions are not defined in the R5RS, keep-matching-items and delete-matching-items are available in the MIT-Scheme. Other implementations should have similar functions.

;(keep-matching-items '(1 2 -3 -4 5) positive?) ;⇒ (1 2 5)

;========================================
;Folding

;Even folding functions are not defined in the R5RS, functions reduce etc. are available in the MIT-Scheme.

;(reduce + 0 '(1 2 3 4))               ; ⇒  10
;(reduce + 0 '(1 2))                   ; ⇒  3
;(reduce + 0 '(1))                     ; ⇒  1
;(reduce + 0 '())                      ; ⇒  0
;(reduce + 0 '(foo))                   ; ⇒  foo
;(reduce list '() '(1 2 3 4))          ; ⇒  (((1 2) 3) 4)

;========================================
;Sorting

;Even sorting functions are not defined in the R5RS, functions sort (merge-sort) and quick-sort are available in the MIT-Scheme.

(sort '(3 5 1 4 -1) <) ; ⇒ (-1 1 3 4 5)

;========================================
;Function apply

;This function is to apply a procedure to a list. Even the function takes arbitrary numbers of arguments, the first and last arguments should be a procedure and a list. The function is really convenient even it does not seem to be.

(apply max '(1 3 2))     ; ⇒   3
(apply + 1 2 '(3 4 5))   ; ⇒  15
(apply - 100 '(5 12 17)) ; ⇒  66

;========================================
;Making Higher Order Functions

;Writing higher order functions by yourself is quite easy. Functions member-if, member, and fractal are defined here as examples.

;member-if and member

;A function member-if takes a predicate and a list as arguments and returns a sub-list of the original whose car is the first item that satisfies the predicate. The function member-if can be defined like as follows:

(define (member-if proc ls)
  (cond
   ((null? ls) #f)
   ((proc (car ls)) ls)
   (else (member-if proc (cdr ls)))))

(member-if positive? '(0 -1 -2 3 5 -7)) ; ⇒  (3 5 -7)

;Further, the function member that checks if the specified item is in the list can be defined like as follows. The function takes three arguments, a function to compare, the specified item, and a list:

(define (member proc obj ls)
  (cond
   ((null? ls) #f)
   ((proc obj (car ls)) ls)
   (else (member proc obj (cdr ls)))))

(member string=? "hello" '("hi" "guys" "bye" "hello" "see you")) ; ⇒  ("hello" "see you")
