
(require-extension srfi-1)
(require-extension srfi-13)

; h é comum isolado pois se refere a prórpia, por isso foi excluido
(define excl-words '("the" "fw:" "re:" "fvv:" "fwd:" "h:" "these" "or" "and" "for" "to" "are" "they"))

;não tiramos o ":" por causa das horas, verificar
(define excl-chars '(#\! #\? #\' #\“ #\” #\, #\; #\( #\) #\&))

;x é membro da lista ls?
(define (member? x ls)
  (cond
   ((null? ls) #f)
   ((equal? x (car ls)) #t)
   (else (member x (cdr ls)))))

;filtre a lista ls com a lista le 
(define (filter-list ls le)
    (filter (lambda (x) (not (member? x excl-words))) ls)
)

;filtre a lista ls com a lista de esclusão padrão 
(define (excl-list ls)
    (filter-list ls excl-words)
)
