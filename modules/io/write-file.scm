(define writer
    (lambda (path values)
        (let ((port (open-output-file path)))
            (display "var words = [" port)
            (newline port)
            (let f ((ls values))
                (if (null? (cdr ls))
                    (if (not (equal? (caar ls) ""))
                        (begin
                            (display "{ text: " port)
                            (write (caar ls) port)
                            (display ", weight: " port)
                            (display (+ (cadar ls) 3) port)
                            (display "}" port)
                            (newline port)))
                    (if (equal? (caadr ls) "")
                        (begin
                            (display "{ text: " port)
                            (write (caar ls) port)
                            (display ", weight: " port)
                            (display (+ 3 (cadar ls)) port)
                            (display " }" port)
                            (newline port)
                            (f (cdr ls)))
                        (if (not (or (or (or (or (or (or (equal? (caar ls) "the") (equal? (caar ls) "these")) (equal? (caar ls) "or")) (equal? (caar ls) "and")) (equal? (caar ls) "for")) (equal? (caar ls) "to")) (equal? (caar ls) "are")))
                            (begin
                                (display "{ text: " port)
                                (write (caar ls) port)
                                (display ", weight: " port)
                                (display (+ 3 (cadar ls)) port)
                                (display " }," port)
                                (newline port)
                                (f (cdr ls)))))))
            (display "];" port)
            (close-output-port port))))