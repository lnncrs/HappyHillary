
;biblioteca
(use srfi-18)

;identidade e tipo da thread atual
(current-thread)
(thread? (current-thread))

;thread se bloquear
(define clock
    (lambda ()
        (let loop ((x 0))
            (print x)
            (thread-sleep! 1)
            (loop (+ x 1)))))

(define clock-thread (make-thread clock))
(thread-start! clock-thread)
(thread-join! clock-thread 10)

