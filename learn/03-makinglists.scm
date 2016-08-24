;========================================
;;; Making Lists
;========================================

;========================================
;Cons Cells

;Cons cells are a memory spaces which storage two addresses. Cons cells can be made by function cons.

(cons 1 2)
;Value 11: (1 . 2)

;Cons cells can be beaded.

(cons 3 (cons 1 2))
;Value 15: (3 1 . 2)

;Cons cells can store different kinds of data and can be nested.

(cons #\a (cons 3 "hello"))
;Value 17: (#\a 3 . "hello")

(cons (cons 0 1) (cons 1 2))
;Value 23: ((0 . 1) 2 . 3)

;========================================
;Lists

;Lists are (beaded) cons cells with the cdr part of the last cons cell being '(). '() is called the empty list, which is included to lists. Even if the data consists of only one cons cell, it is a list if the cdr part is '().

;Actuary, list can be defined recursively like as follows:
;*'() is a list.
;*If ls is a list and obj is a kind of data, (cons obj ls) is a list.
;As lists are data structure defined recursively, it is reasonable to be used in recursive functions.

;========================================
;atoms

;Data structures which do not use cons cells are called atom. Numbers, characters, strings, vectors, and '() are atom. '() is an atom and a list as well.

;========================================
;Quote

;All tokens are ready to be evaluated due to the Scheme's rule of the evaluation that tokens in parentheses are evaluated from inner to outer and that the value comes out from the outermost parentheses is the value of the S-expression. A special form named quote is used to protect tokens from evaluation. It is for giving symbols or lists to a program, which became something else by evaluation.

;For instance, while (+ 2 3) is evaluated to be 5, (quote (+ 2 3)) gives a list (+ 2 3) itself to the program. As quote is frequently used, it is abbreviated as '.
;For example:
;*'(+ 2 3) represents a list (+ 2 3) itself.
;*'+ represents a symbol + itself.

;Actually, '() is a quoted empty list, which means that you should write '() to represent an empty list while the interpreter responds () for an empty list.

;========================================
;Functions car and cdr

;Functions that returns the car part and the cdr part of a cons cell is called car and cdr, respectively. If the value of cdr is a beaded cons cells, the interpreter prints whole values of the car parts. If the cdr part of the last cons cell is not '(), the value is also shown after ..

(car '(1 2 3 4))
;Value: 1

(cdr '(1 2 3 4))
;Value: (2 3 4)

;========================================
;Function list

;Function list is available to make a list consisting of several elements. Function list takes arbitrary numbers of arguments and returns a list of them.

(list)
;Value: ()

(list 1)
;Value: (1)

(list '(1 2) '(3 4))
;Value: ((1 2) (3 4))

(list 0)
;Value: (0)

(list 1 2)
;Value: (1 2)


