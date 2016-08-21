;; procedure: read [input-port]
;;
;; Converts external representations of Scheme objects into the objects themselves. read returns the
;; next object parsable from input-port, updating input-port to point to the first character past 
;; the end of the written representation of the object. If an end of file is encountered in the 
;; input before any characters are found that can begin an object, read returns an end-of-file 
;; object. The input-port remains open, and further attempts to read will also return an end-of-file
;; object. If an end of file is encountered after the beginning of an object's written
;; representation, but the written representation is incomplete and therefore not parsable, an error
;; is signalled. 

(define reader
    (lambda (path)
        (let ((port (open-input-file path)))
            (letrec
                ((word
                    (lambda ()
                        (list->string
                            (let f ()
                            (let ((c (read-char port)))
                                (cond
                                    ((eof-object? c) '())
                                    ((not (or (or (or (equal? c '#\newline) (equal? c '#\space')) (equal? c '#\.')) (equal? c '#\,)))
                                    ;(read-char port)
                                    (cons c (f)))
                                    (else '())))))))
                 (list
                    (lambda ()
                      (if (eof-object? (peek-char port))
                        '()
                        (cons (word) (list))))))
            (list)))))
                            

                


            ;(let rdr ((c (read-char port)))
            ;    (if (eof-object? c)
                     