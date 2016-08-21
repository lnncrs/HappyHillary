(define count-list
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

(define a (cons 'la (cons 'la (cons 'b (cons 'c '())))))
(define b (cons 'a (cons 'c (cons 'e (cons 'a (cons 'a (cons 'a (cons 'b (cons 'c (cons 'd (cons 'd (cons 'c (cons 'c (cons 'e (cons 'e '())))))))))))))))

;(load "/home/gmurayama/HappyHillary/modules/io/read-file.scm")
(load "C:\\Users\\lenin\\Documents\\Projects\\ufabc-pp-happyhillary\\modules\\io\\read-file.scm")

;(define txt (reader "/home/gmurayama/HappyHillary/modules/io/a.txt"))
(define txt (reader "C:\\Users\\lenin\\Documents\\Projects\\ufabc-pp-happyhillary\\data\\test\\leak_subj_201505-ansi.txt"))

(count-list txt)



