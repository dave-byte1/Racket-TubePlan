#lang racket

;; All Elizabeth line stations in order
(define stations '("Paddington" "Acton Main Line" "Ealing Broadway" "West Ealing" "Hanwell" "Southall" "Hayes & Harlington" "West Drayton" "Heathrow Terminal 4" "Heathrow Terminal 5" "Slough" "Langley" "Iver" "Richings Park" "Taplow" "Burnham" "Maidenhead" "Twyford" "Reading" "Reading West" "Tilehurst" "Pangbourne" "Purley on Thames" "Purley" "Cholsey" "Wallingford" "Goring & Streatley" "Cholsey" "Didcot Parkway" "Foxhall" "Littlemore" "Oxford" "Kennington" "Vauxhall" "Stockwell" "Brixton" "Herne Hill" "West Dulwich" "Sydenham Hill" "Forest Hill" "Honor Oak Park" "Brockley" "New Cross Gate" "Surrey Docks Farm" "Canada Water" "Canary Wharf" "North Woolwich" "West Silvertown" "Pontoon Dock" "London City Airport" "King George V" "Custom House for ExCeL" "Prince Regent" "Royal Albert" "Beckton Park" "Cyprus" "Gallions Reach" "Beckton" "Royal Victoria" "Canning Town" "Star Lane" "West Ham" "Plaistow" "Upton Park" "East Ham" "Barking"))

;; Distance matrix between the stations (filled with increments of 0.4)
(define distances (for/list ([i (in-range (length stations))])
(for/list ([j (in-range (length stations))])
(if (= i j)
0
(* 0.4 (abs (- i j)))))))

;; a function to calculate the distance between two stations
(define (distance start-station end-station)
  (list-ref (list-ref distances (index-of stations start-station)) (index-of stations end-station)))

(define (time start-station end-station)
  (* (distance start-station end-station) 2))


;; Prompts user to enter the starting and ending stations
(define start-station (read-line))
(define end-station (read-line))


(if (not (member start-station stations))
    (display "Invalid station")
    (begin
     (printf "The distance between ~a and ~a is ~a miles\n" start-station end-station (distance start-station end-station))
     (printf "The time between ~a and ~a is ~a minutes\n" start-station end-station (time start-station end-station))
    ))



