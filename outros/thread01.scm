
;biblioteca
(use srfi-18)

;identidade e tipo da thread atual
(current-thread)
(thread? (current-thread))

;thread anonima
(make-thread (lambda () "hello world"))

;thread nomeada
(make-thread (lambda () "my named thread")
    'my-thread)

;estados possíveis
;{created, ready, running, blocked, suspended, sleeping, terminated, dead}

;verificar estado
(define t (make-thread (lambda () "hello world")))
(thread-state t)

;tornar thread executavel
(define t
    (make-thread
        (lambda ()
            (define this-thread (current-thread))
            (list this-thread (thread-state this-thread)))
        'my-thread))

(thread-state t)
(thread-start! t)
(thread-state t)

;fazer a thread atual ceder o contexto a uma outra thread
(current-thread)
(thread-state t)
(thread-join! t)
(thread-state t)

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

;thread ceder seu quantum
(thread-start!
    (make-thread
        (lambda ()
            (print (current-thread)))))

(print (current-thread))

(let loop ((i 0)) ;infinite loop
    (thread-yield!)
    (loop (+ i 1)))

(print (current-thread))


