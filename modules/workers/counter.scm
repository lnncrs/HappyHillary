(define count-list
    (lambda (l)
        (letrec            
            ((count
                (lambda (l w s) ; list word size
                    (if (null? (cdr l))
                        s
                        (if (equal? w (car l))
                            (count (cdr l) w (+ s 1))
                            (count (cdr l) w s)))))
              (unique 
                (lambda (rslt list)
                    (if (null? list)
                        rslt
                        (let ((next (car list))
                            (rest (cdr list)))
                        (if (list? next)
                            (unique rslt (append next rest))
                            (unique (if (memq next rslt)
                                        rslt
                                        (cons next rslt))
                                    rest))))))
              (run
                (lambda (u list)
                    (if (null? (cdr u))
                        '()
                        (cons (cons (car list) (cons (count (cdr list) (car u) 0) '())) (run (cdr u) (cdr list))))))
            )
            (run (unique '() l) l))))

(define a (cons 'la (cons 'la (cons 'b (cons 'c '())))))
a

(count-list a)