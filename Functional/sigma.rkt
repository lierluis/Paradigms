(define (sigma . args)
  (sqrt
   (-
    (/ (apply + (map (lambda (number) (expt number 2)) args)) (length args))
    (expt (/ (apply + args) (length args)) 2) ; mean of n numbers
   )
  )
)

#| sample output

> (sigma 1 2 3 2 1)
0.7483314773547883
> (sigma 1 3 1 3 1 3)
1
> (sigma 1 3)
1
> (sigma 1)
0

|#
