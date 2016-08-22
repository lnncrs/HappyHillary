
;Chicken
;(use utils)
;(read-all "a.txt")

;; function read a word
(define read-word
  (lambda (p)
    (list->string
      (let f ()
        (let ((c (peek-char p)))
          (cond
            ((eof-object? c) '())
            ((char-alphabetic? c)
             (read-char p)
             (cons c (f)))
            (else '())))))))

;; Read a text file char by char
(call-with-input-file "a.txt"
  (lambda (input-port)
    (let loop ((x (read-char input-port)))
      (if (not (eof-object? x))
          (begin
            (display x)
            (loop (read-char input-port)))))))

;; Read a text file
;(call-with-input-file "a.txt"
;  (lambda (input-port)
;    (let loop ((x (read-char input-port)))
;      (if (not (eof-object? x))
;          (begin
;            (display x)
;            (loop (read-char input-port)))))))

;; Write to a text file
;(call-with-output-file "b.txt"
;  (lambda (output-port)
;    (display "hello, world" output-port))) ;; or (write "hello, world" output-port)