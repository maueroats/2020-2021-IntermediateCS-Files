;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Art-Make-Transparent) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define (transparent-color x y c)
  (if (color=? c (colorize "white"))
      (make-color 0 0 0 0)
      c))

(define demo-1 (circle 10 "solid" "red"))
(define demo-2 (circle 20 "solid" "white"))
(define demo-3 (circle 30 "solid" "blue"))
(define demo-4 (overlay demo-2 demo-3))
(define transparent-4
  (map-image transparent-color demo-4))

"This is demo-4 on top of demo-1. You cannot see through demo-4."
(overlay demo-4 demo-1)

"This is transparent-4 on top of demo-1. You see through the white in transparent-4."
(overlay transparent-4 demo-1)
