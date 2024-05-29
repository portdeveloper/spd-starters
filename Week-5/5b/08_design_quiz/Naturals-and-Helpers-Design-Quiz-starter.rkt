;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Naturals-and-Helpers-Design-Quiz-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; SPD2-Design-Quiz-1.rkt


;; ======================================================================
;; Constants
(define TRI (triangle 20 "solid" "red"))

;; ======================================================================
;; Data Definitions

;; Natural is one of:
;;  - 0
;;  - (add1 Natural)
;; interp. a natural number
(define N0 0)         ;0
(define N1 (add1 N0)) ;1
(define N2 (add1 N1)) ;2

#;
(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (... n   ; n is added because it's often useful
              (fn-for-natural (sub1 n)))]))

;; Template rules used:
;;  - one-of: two cases
;;  - atomic distinct: 0
;;  - compound: 2 fields
;;  - self-reference: (sub1 n) is Natural




; PROBLEM 1:
;
; Complete the design of a function called pyramid that takes a natural
; number n and an image, and constructs an n-tall, n-wide pyramid of
; copies of that image.
;
; For instance, a 3-wide pyramid of cookies would look like this:
;
; .


;; Natural Image -> Image
;; produce an n-wide pyramid of the given image
(check-expect (pyramid 0 TRI) empty-image)
(check-expect (pyramid 1 TRI) TRI)
(check-expect (pyramid 3 TRI)
              (above TRI
                     (beside TRI TRI)
                     (beside TRI TRI TRI)))

;(define (pyramid n i) empty-image) ; stub

(define (pyramid n img)
  (cond [(zero? n) empty-image]
        [else
         (above (pyramid (sub1 n) img) (one-line n img))]))


(define (one-line n img)
  (cond [(zero? n) empty-image]
        [else
         (beside img (one-line (sub1 n) img))])) 


 
; Problem 2:
; Consider a test tube filled with solid blobs and bubbles.  Over time the
; solids sink to the bottom of the test tube, and as a consequence the bubbles
; percolate to the top.  Let's capture this idea in BSL.
;
; Complete the design of a function that takes a list of blobs and sinks each
; solid blob by one. It's okay to assume that a solid blob sinks past any
; neighbor just below it.
;
; To assist you, we supply the relevant data definitions.


;; Blob is one of:
;; - "solid"
;; - "bubble"
;; interp.  a gelatinous blob, either a solid or a bubble
;; Examples are redundant for enumerations
#;
(define (fn-for-blob b)
  (cond [(string=? b "solid") (...)]
        [(string=? b "bubble") (...)]))

;; Template rules used:
;; - one-of: 2 cases
;; - atomic distinct: "solid"
;; - atomic distinct: "bubble"


;; ListOfBlob is one of:
;; - empty
;; - (cons Blob ListOfBlob)
;; interp. a sequence of blobs in a test tube, listed from top to bottom.
(define LOB0 empty) ; empty test tube
(define LOB2 (cons "solid" (cons "bubble" empty))) ; solid blob above a bubble
(define LOB3 (cons "solid" (cons "solid" (cons "bubble" empty))))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fn-for-blob (first lob))
              (fn-for-lob (rest lob)))]))

;; Template rules used
;; - one-of: 2 cases
;; - atomic distinct: empty
;; - compound: 2 fields
;; - reference: (first lob) is Blob
;; - self-reference: (rest lob) is ListOfBlob

;; ListOfBlob -> ListOfBlob
;; produce a list of blobs that sinks the given solid blobs by one

(check-expect (sink empty) empty)
(check-expect (sink (cons "bubble" (cons "solid" (cons "bubble" empty))))
              (cons "bubble" (cons "bubble" (cons "solid" empty))))

(check-expect (sink (cons "solid" (cons "solid" (cons "bubble" empty))))
              (cons "bubble" (cons "solid" (cons "solid" empty))))

(check-expect (sink (cons "solid" (cons "bubble" (cons "bubble" empty))))
              (cons "bubble" (cons "solid" (cons "bubble" empty)))) 
(check-expect (sink (cons "solid" (cons "bubble" (cons "solid" empty))))
              (cons "bubble" (cons "solid" (cons "solid" empty))))
(check-expect (sink (cons "bubble" (cons "solid" (cons "solid" empty))))
              (cons "bubble" (cons "solid" (cons "solid" empty))))
(check-expect (sink (cons "solid"
                          (cons "solid"
                                (cons "bubble" (cons "bubble" empty))))) 
              (cons "bubble" (cons "solid"
                                   (cons "solid" (cons "bubble" empty)))))
;(define (sink lob) empty) ; stub
 
(define (sink lob)
  (cond [(empty? lob) empty]
        [(empty? (rest lob)) lob]
        [else
         (helper (first lob) (rest lob))]))


;; Blob ListOfBlob -> ListOfBlob
;; helper function
;; ASSUMES that lob has at least 1 element
(check-expect (helper "bubble" (cons "solid" empty))
              (cons "bubble" (cons "solid" empty)))
(check-expect (helper "solid" (cons "bubble" empty))
              (cons "bubble" (cons "solid" empty)))
(check-expect (helper "solid" (cons "bubble" (cons "bubble" empty)))
              (cons "bubble" (cons "solid" (cons "bubble" empty))))


(define (helper b lob)
  (cond [(string=? b "bubble") (cons b lob)]
        [
        



 
 