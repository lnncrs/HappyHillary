
(require-extension srfi-1)
(require-extension srfi-13)

; h é comum isolado pois se refere a prórpia, por isso foi excluido
(define excl-words '("what" "says" "i" "your" "that" "this" "yet" "is" "s" "by" "who" "was" "when" "do" "any" "so" "as" "--" "-" "a" "an" "at" "you" "got" "on" "in" "from" "hey" "of" "\r" "" "the" "fw" "fw:" "re" "re:" "fvv" "fvv:" "fwd" "fwd:" "these" "or" "and" "for" "to" "are" "they" "that"))

;não tiramos o ":" por causa das horas, verificar
(define excl-chars '(#\@ #\_ #\: #\[ #\] #\. #\! #\? #\' #\“ #\” #\, #\; #\( #\) #\&))

(define excl-chars?
    (lambda (c)
        (let e-c? ((ls excl-chars))
            (cond
                ((null? ls) #f)
                ((equal? c (car excl-chars)) #t)
                (else (e-c? (cdr ls)))))))

;x é membro da lista ls?
(define (member? x ls)
  (cond
   ((null? ls) #f)
   ((equal? x (car ls)) #t)
   (else (member x (cdr ls)))))

;filtre a lista ls com a lista le
(define (filter-list ls le)
    (filter (lambda (x) (not (member? x excl-words))) ls))

;filtre a lista ls com a lista de esclusão padrão 
(define (excl-list ls)
    (filter-list ls excl-words)
)

;injeta um trecho de código em um modelo com tag pré-definida
(define (string-inject model tag inject)
(let  (
      ;(model "the #tag# is here")
      ;(tag "#tag#")
      ;(inject "mayor")
      (pos (string-contains model tag))
      )
    (if(number? pos)
        (string-replace model inject pos (+ pos (string-length inject)))
        #f)
))

;cria uma lista com outra lista (uso futuro)
(define (run ls)
    (if (not (null? ls))
        (cons (car ls) (run (cdr ls)))
        '())
)