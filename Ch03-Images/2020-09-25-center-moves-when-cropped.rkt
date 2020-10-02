;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 2020-09-25-center-moves-when-cropped) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

;; Joon noticed that the center of the circle moves when you crop it so that it becomes flat.
;; That caused problems for making his art.

(define c
  (overlay/offset (text "original center" 14 "darkred")
                  0 10
                  (overlay (circle 2 "solid" "darkred")
                           (circle 100 "solid" "blue"))))

;; I made this so the next part would be easier to read.
(define (crop-left* x image)
  (crop-left image x))

(define c-all-cropped
  (rotate 120
          (crop-left* 25
                     (rotate 120
                             (crop-left* 25
                                        (rotate 120
                                                (crop-left* 25
                                                           c)))))))

(define c-marked-center
  (overlay/offset (text "new center" 14 "sienna")
                  0 -10
                  (overlay (circle 2 "solid" "sienna")
                           c-all-cropped)))

(define orange-circle
  (circle 100 "solid" "orange"))

"See the center moves so it is not on the middle of the circle."

(define visualization-1
  (overlay c-marked-center
           orange-circle))

(define visualization-2
  (overlay (circle 2 "solid" "red")
           orange-circle))

(define visualization-3
  (overlay/align "middle" "bottom"
                 (line 0 200 "red")
                 visualization-1))

(scale 3 visualization-3)

(define fixed-center
  (overlay/align "right" "middle"
                 c-marked-center
                 orange-circle))


(define visualization-4
  (overlay/align "middle" "bottom"
                 (line 0 200 "red")
                 fixed-center))

(scale 3 visualization-4)
