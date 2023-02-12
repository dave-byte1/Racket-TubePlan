#lang racket

;;5 stations on the Elizabeth line
(define stations '("Paddington" "Bond Street" "Liverpool Street" "Tottenham Court Road" "King's Cross St. Pancras"))

;; distance matrix between the 5 stations
(define distances '((0 1.5 2.5 3.5 4.5)
                    (1.5 0 1.0 2.0 3.0)
                    (2.5 1.0 0 1.0 2.0)
                    (3.5 2.0 1.0 0 1.0)
                    (4.5 3.0 2.0 1.0 0)))

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



