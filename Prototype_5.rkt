#lang racket/gui
(require racket/draw
         net/url)

;; All Elizabeth line stations in order
(define stations '("Paddington" "Acton Main Line" "Cyprus" "Gallions Reach" "Beckton" "Royal Victoria" "Canning Town" "Star Lane" "West Ham" "Plaistow" "Upton Park" "East Ham" "Barking"))


;Dropdown frame
(define frame (new frame% [label "Drop-down Example"] ;;Frame
                   [width 500] [height 800]))

(define logo ;;TubePlan logo
  (read-bitmap (get-pure-port (string->url "https://tubeplan.w3spaces.com/TUBEPLAN4.png"))))
(define f (new frame% [label "A picture"]))
(void (new message% [parent frame] [label logo]))

(define tubeplan (new message%
                      [parent frame]
                      [label "Elizabeth Line"]))


(define drop-down (new choice% [parent frame] ;;Drop-down for start-station
                                [label "From Station"]
                                [choices stations]))

(define drop-down2 (new choice% [parent frame] ;;Drop-down for end-station
                                [label "To Station     "]
                                [choices stations]))


(define button (new button% [parent frame] ;;Button
                            [label "Let's Go"]
                            [callback (lambda (button event)
                                        (let ([start-station (send drop-down get-string-selection)] ;;Start-station defined
                                              [end-station (send drop-down2 get-string-selection)]) ;;End-station defined
                                              (send result-text set-label (format "From: ~a\nTo: ~a\nTime: ~a minutes\nDistance: ~a miles\n" start-station end-station (time start-station end-station) (distance start-station end-station)))))]))

(define result-text (new message%
                         [parent frame]
[label "

                                        "])) ;;Message label to display time and distance

(send frame show #t)

;; Distance matrix between the stations (filled with increments of 0.5)
(define distances (for/list ([i (in-range (length stations))])
(for/list ([j (in-range (length stations))])
(if (= i j)
0
(* 0.5 (abs (- i j)))))))

;; a function to calculate the distance between two stations
(define (distance start-station end-station)
  (list-ref (list-ref distances (index-of stations start-station)) (index-of stations end-station)))

;; a function to calculate the time between two stations
(define (time start-station end-station)
  (* (distance start-station end-station) 2))
