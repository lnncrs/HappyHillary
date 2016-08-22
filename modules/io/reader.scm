;necessita da lib "utils.scm"

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
                                    ((or (or (eof-object? c) (equal? c '#\newline)) (equal? c '#\space)) '())
                                    ;((not (or (or (or (or (equal? c '#\newline) (equal? c '#\space')) (equal? c '#\.')) (equal? c '#\,)) (equal? c '#\-)))
                                    ((not (excl-chars? c))
                                    (cons c (f)))
                                    (else (f))))))))
                 (list
                    (lambda ()  
                      (if (eof-object? (peek-char port))
                        '()
                        (cons (string-downcase (word)) (list))))))
            (list)))))
