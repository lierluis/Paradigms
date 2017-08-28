(define (line n)
  (if (> n 0)
      (begin
        (display "*") ; side effect
        (line (- n 1))) ; recursive call
      (display #\newline)
  )
)

(define (histogram lst)
  (if (> (length lst) 0)
      (begin
        (line (first lst)) ; side effect (print head)
        (histogram (rest lst))) ; recursive call (tail)
      (display #\newline)
  )
)

#| sample output

> (line 5)
*****
> (histogram '(1 2 3 3 2 1))
*
**
***
***
**
*

|#
