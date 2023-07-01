(load "1.2.6-smallest-divisor.scm")
; example code
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))
    #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

; exercise resolution
(define (search-for-primes greater-than)
  (define next_number (+ greater-than 1))
  (if (prime? next_number)
    next_number
    (search-for-primes next_number)
    ))

(display (search-for-primes 100))

(define (next-three-primes greater-than)
  (define start-time (runtime))
  (define first-prime (search-for-primes greater-than))
  (define second-prime (search-for-primes first-prime))
  (define third-prime (search-for-primes second-prime))

  (newline)
  (display (list "three primes greater than " greater-than " are " first-prime second-prime third-prime))
  (newline)
  (display (list "calculated in " (- (runtime) start-time) " seconds."))
  (list first-prime second-prime third-prime))

(next-three-primes 1000)
(next-three-primes 10000)
(next-three-primes 100000)
(next-three-primes 1000000)
(next-three-primes 10000000)
(next-three-primes 100000000)
