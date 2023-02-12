#lang racket/gui

;; All Elizabeth line stations in order
(define stations '("Paddington" "Acton Main Line" "Ealing Broadway" "West Ealing" "Hanwell" "Southall" "Hayes & Harlington" "West Drayton" "Heathrow Terminal 4" "Heathrow Terminal 5" "Slough" "Langley" "Iver" "Richings Park" "Taplow" "Burnham" "Maidenhead" "Twyford" "Reading" "Reading West" "Tilehurst" "Pangbourne" "Purley on Thames" "Purley" "Cholsey" "Wallingford" "Goring & Streatley" "Cholsey" "Didcot Parkway" "Foxhall" "Littlemore" "Oxford" "Kennington" "Vauxhall" "Stockwell" "Brixton" "Herne Hill" "West Dulwich" "Sydenham Hill" "Forest Hill" "Honor Oak Park" "Brockley" "New Cross Gate" "Surrey Docks Farm" "Canada Water" "Canary Wharf" "North Woolwich" "West Silvertown" "Pontoon Dock" "London City Airport" "King George V" "Custom House for ExCeL" "Prince Regent" "Royal Albert" "Beckton Park" "Cyprus" "Gallions Reach" "Beckton" "Royal Victoria" "Canning Town" "Star Lane" "West Ham" "Plaistow" "Upton Park" "East Ham" "Barking"))


;Dropdown frame
(define myframe (new frame% [label "My␣Window"]
[width 200] [height 200]))

(define frame (new frame% [label "Drop-down Example"]))

(define options '("Option 1" "Option 2" "Option 3"))

(define drop-down (new choice% [parent frame]
                                [label "From Station"]
                                [choices stations]))


(define drop-down2 (new choice% [parent frame]
                                [label "To Station     "]
                                [choices stations]))
(define (on-select)
  (printf "Selected: ~a\n" (send drop-down get-value)))


(define button (new button% [parent frame]
                            [label "Let's Go"]))

(define (on-click)
  (printf "Button clicked\n"))
(send frame show #t)

;; Distance matrix between the stations (filled with increments of 0.4)
(define distances (for/list ([i (in-range (length stations))])
(for/list ([j (in-range (length stations))])
(if (= i j)
0
(* 0.4 (abs (- i j)))))))
;; a function to calculate the distance between two stations
(define (distance start-station end-station)
  (list-ref (list-ref distances (index-of stations start-station)) (index-of stations end-station)))

;; a function to calculate the time between two stations
(define (time start-station end-station)
  (* (distance start-station end-station) 2))
