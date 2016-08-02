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

(define reader-lines
    (lambda (path)
        (let ((port (open-input-file path)))        ;; amarra "port" com a input-port dada
            (let rdr ((p (read port)))              ;; retorna uma string e amarra a "p"
                (if (eof-object? p)                 ;; eof = end of file
                    (begin                          ;; avalia duas expressões (cima pra baixo)
                        (close-input-port port)     
                        '())
                    (if (equal? (peek-char port) '#\newline)    
                        (cons p (cons (rdr (read port)) '()))  ;; a cada nova linha, uma nova 
                                                               ;; lista se inicia
                        (cons p (rdr (read port)))))))))

(define reader
    (lambda (path)
        (let ((port (open-input-file path)))        ;; amarra "port" com a input-port dada
            (let rdr ((p (read port)))              ;; retorna uma string e amarra a "p"
                (if (eof-object? p)                 ;; eof = end of file
                    (begin                          ;; avalia duas expressões (cima pra baixo)
                        (close-input-port port)     
                        '())
                        (cons p (rdr (read port))))))))

(reader "txt2.txt")