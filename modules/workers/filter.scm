(require-extension srfi-1)

(define b (cons 'a (cons 'c (cons 'e (cons 'a (cons 'a (cons 'a (cons 'b (cons 'c (cons 'd (cons 'd (cons 'c (cons 'c (cons 'e (cons 'e '())))))))))))))))

(filter even? '(0 7 8 8 43 -4))
(any even? '(1 2 3))

(define excl '(a b c d e))



(display excl)





