;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fact) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Natural is one of:
;; - 0
;; - (add1 Natural)
;; interp. a natural number
(define N0 0)           ;0
(define N1 (add1 N0))   ;1
(define N2 (add1 N1))   ;2

#; 
(define (fn-for-natural n)
  (cond [(zero? n)(...)]
        [else
         (... n
              (fn-for-natural (sub1 n)))]))

;; Natural -> Natural
;; compute n * n-1 * n-2 * ... * 1
(check-expect (fact 0) 1)
(check-expect (fact 1) 1)
(check-expect (fact 2) 2)
(check-expect (fact 3) 6)

;(define (fact n) 1) ;stub

(define (fact n)
  (cond [(zero? n) 1]
        [else
         (* n
              (fact (sub1 n)))]))