(define counter
    (lambda (l)
        (letrec            
            ((count
                (lambda (l w s) ; list word size
                    (if (null? (cdr l))
                        (if (equal? w (car l))
                            (+ s 1)
                            s)
                        (if (equal? w (car l))
                            (count (cdr l) w (+ s 1))
                            (count (cdr l) w s)))))
              (unique 
                (lambda (l)
                        (cond 
                            ((null? l) '())
                            ((member (car l) (cdr l)) (unique (cdr l)))
                            (else (cons (car l) (unique (cdr l)))))))
              (run
                (lambda (u l) ;; unique-list original-list
                    (if (null? (cdr u))
                        ;'
                        (cons (cons (car u) (cons (count l (car u) 0) '())) '())
                        (cons (cons (car u) (cons (count l (car u) 0) '())) (run (cdr u) l)) )))) 
                        
            (run (unique l) l))))
