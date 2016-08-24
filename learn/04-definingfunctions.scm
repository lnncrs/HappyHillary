;========================================
;;; Defining Functions
;========================================

;========================================
;How to define simple functions and to load them

;You use define to bind a symbol to a value. You can define any kind of global parameters, such as numbers, characters, lists, etc. and functions by this operator.

; Hello world as a variable
(define vhello "Hello world")

; Hello world as a function
(define fhello (lambda ()
		 "Hello world"))

vhello
;Value 15: "Hello world"

fhello
;Value 16: #[compound-procedure 16 fhello]

(fhello)
;Value 17: "Hello world"

;========================================
;Defining functions with parameters

;Put a list of parameters after lambda to define functions with parameters. 

; hello with name
(define hello
  (lambda (name)
    (string-append "Hello " name "!")))

; sum of three numbers
(define sum3
  (lambda (a b c)
    (+ a b c)))

;========================================
;A short form for function definitions

; hello with name
(define (hello name)
  (string-append "Hello " name "!"))

; sum of three numbers
(define (sum3 a b c)
  (+ a b c))





