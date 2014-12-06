(define MKPORT #f)

(define (mkopen name modue)
  (set! MKPORT (open-file name mode))
  #f)

(define (mkwrite s)
  (display s MKPORT)
  (newline MKPORT)
  #f)

(define (mkclose)
  (close-port MKPORT)
  #f)
