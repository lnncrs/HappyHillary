;========================================
;;; Input/Output
;========================================

;========================================
;Input from files

;pen-input-file, read-char, and eof-object?

;The function (open-input-file filename) is available to open a file. This function return a port for input. The function (read-char port) is to read a character from the port. As this function returns eof-object when it reaches the end of the file (EOF), you can check it by using eof-object?. The function (close-input-port port) is to close the input port. The [code 1] shows a function that returns file contents as string.

;[code 1]

(define (read-file file-name)
  (let ((p (open-input-file file-name)))
    (let loop((ls1 '()) (c (read-char p)))
      (if (eof-object? c)
	  (begin
	    (close-input-port p)
	    (list->string (reverse ls1)))
	  (loop (cons c ls1) (read-char p))))))

;For instance, the result shown in [example 1] is obtained by applying the [code 1] to a file [hello.txt]. As the newline character is represented by '\n', it is not easy to read. Function display is available, however, for formatting ([example 2]).

;[hello.txt]
;Hello world!
;Scheme is an elegant programming language.

;[example 1]
;(cd "C:\\doc")
(read-file "hello.txt")
;Value 14: "Hello world!\nScheme is an elegant programming language.\n"

;[example 2]
(display (read-file "hello.txt"))

;Hello world!
;Scheme is an elegant programming language.
;Unspecified return value



