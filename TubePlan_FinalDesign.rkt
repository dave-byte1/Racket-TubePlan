#lang racket/gui
(require racket/draw
         net/url)


;; All Elizabeth line stations (London Paddington ↔ Reading)
(define stations '("London Paddington" "Acton Main Line" "Ealing Broadway" "West Ealing" "Hanwell" "Southall" "Hayes & Harlington" "West Drayton" "Iver Rail Station" "Langley (Berks)" "Slough" "Burnham (Berks)" "Taplow" "Maidenhead" "Twyford" "Reading"))
;; All Victoria line stations (Brixton ↔ Walthamstow Central)
(define vic-stations '("Brixton" "Stockwell" "Vauxhall" "Pimlico" "Victoria" "Green Park" "Oxford Circus" "Warren Street" "Euston" "King's Cross St. Pancras" "Highbury & Islington" "Finsbury Park" "Seven Sisters" "Tottenham Hale" "Blackhorse Road" "Walthamstow Central"))
;; All Central line stations (West Ruislip ↔ Epping)
(define cent-stations '("West Ruislip" "Ruislip Gardens" "South Ruislip" "Northolt" "Greenford" "Perivale" "Hanger Lane" "North Acton" "East Acton" "White City" "Shepherd's Bush (Central)" "Holland Park" "Notting Hill Gate" "Queensway" "Lancaster Gate" "Marble Arch" "Bond Street" "Oxford Circus" "Tottenham Court Road" "Holborn" "Chancery Lane" "St. Paul's" "Bank Station" "Liverpool Street" "Bethnal Green" "Mile End" "Stratford" "Leyton" "Leytonstone" "Snarebrook" "South Woodford" "Woodford" "Buckhurst Hill" "Loughton" "Debden" "Theydon Bois" "Epping"))
;; All Northern line stations (Morden ↔ High Barnet via Bank)
(define nort-stations '("Morden" "South Wimbledon" "Colliers Wood" "Tooting Broadway" "Tooting Bec" "Balham" "Clapham South" "Clapham Common" "Clapham North" "Stockwell" "Oval" "Kennington" "Elephant & Castle" "Borough" "London Bridge" "Bank Station" "Moorgate" "Old Street" "Angel" " King's Cross St. Pancras" "Euston" "Camden Town" "Kentish Town" "Tufnell Park" "Archway" "Highgate" "East Finchley" "Finchley Central" "West Finchley" "Woodside Park" "Totteridge & Whetstone" "High Barnet"))





;Dropdown frame
(define frame (new frame% [label "TubePlan"] ;;Frame
                   [width 500] [height 800]))
(define panel (new vertical-panel%
                   [parent frame]
                   [style '(vscroll hscroll)]))


(define logo ;;TubePlan logo
  (read-bitmap (get-pure-port (string->url "https://tubeplan.w3spaces.com/TUBEPLAN4.png"))))
(define f (new frame% [label "A picture"]))
(void (new message% [parent panel] [label logo]))


;;Elizabeth Line GUI
(define LizLine (new message%
                      [parent panel]
                      [label "Elizabeth Line"]))
(define Padd-Read (new message%
                      [parent panel]
                      [label "London Paddington ↔ Reading"]))


(define drop-down (new choice% [parent panel] ;;Drop-down for start-station
                                [label "From Station"]
                                [choices stations]))

(define drop-down2 (new choice% [parent panel] ;;Drop-down for end-station
                                [label "To Station     "]
                                [choices stations]))


(define button (new button% [parent panel] ;;Button
                            [label "Let's Go"]
                            [callback (lambda (button event)
                                        (let ([start-station (send drop-down get-string-selection)] ;;Start-station defined
                                              [end-station (send drop-down2 get-string-selection)]) ;;End-station defined
                                              (send result-text set-label (format "From: ~a\nTo: ~a\nTime: ~a minutes\nDistance: ~a miles\n" start-station end-station (time start-station end-station) (distance start-station end-station)))))]))


(define result-text (new message%
                         [parent panel]
[label "

                                                       "])) ;;Message label to display time and distance


(define Eliz-map-image (new message%
                      [parent panel]
                      [label "Elizabeth Line Stations Map"]))

(define panel5 (new vertical-panel%
                   [parent panel]
                   [style '(vscroll hscroll)]
                   [min-width 450]	 
   	 	   [min-height 200]))

(define logo5 ;;Central Map
  (read-bitmap (get-pure-port (string->url "https://tubeplan.w3spaces.com/Elizabeth-line-map.png"))))
(define e (new frame% [label "A picture"]))
(void (new message% [parent panel5] [label logo5]))



;;Victoria Line GUI
(define VicLine (new message%
                      [parent panel]
                      [label "Victoria Line"]))
(define Vic-to (new message%
                      [parent panel]
                      [label "Brixton ↔ Walthamstow Central"]))

(define vic-drop-down (new choice% [parent panel] ;;Drop-down for start-station
                                [label "From Station"]
                                [choices vic-stations]))

(define vic-drop-down2 (new choice% [parent panel] ;;Drop-down for end-station
                                [label "To Station     "]
                                [choices vic-stations]))


(define vic-button (new button% [parent panel] ;;Button
                            [label "Let's Go"]
                            [callback (lambda (button event)
                                        (let ([vic-start-station (send vic-drop-down get-string-selection)] ;;Start-station defined
                                              [vic-end-station (send vic-drop-down2 get-string-selection)]) ;;End-station defined
                                              (send vic-result-text set-label (format "From: ~a\nTo: ~a\nTime: ~a minutes\nDistance: ~a miles\n" vic-start-station vic-end-station (vic-time vic-start-station vic-end-station) (vic-distance vic-start-station vic-end-station)))))]))


(define vic-result-text (new message%
                         [parent panel]
[label "

                                                         "])) ;;Message label to display time and distance


(define Vic-map-image (new message%
                      [parent panel]
                      [label "Victoria Line Stations Map"]))

(define panel4 (new vertical-panel%
                   [parent panel]
                   [style '(vscroll hscroll)]
                   [min-width 450]	 
   	 	   [min-height 200]))

(define logo4 ;;Central Map
  (read-bitmap (get-pure-port (string->url "https://tubeplan.w3spaces.com/Victoria-line-map1.png"))))
(define v (new frame% [label "A picture"]))
(void (new message% [parent panel4] [label logo4]))


;;Central Line GUI
(define CentLine (new message%
                      [parent panel]
                      [label "Central Line"]))
(define Cent-to (new message%
                      [parent panel]
                      [label "West Ruislip ↔ Epping"]))


(define cent-drop-down (new choice% [parent panel] ;;Drop-down for start-station
                                [label "From Station"]
                                [choices cent-stations]))

(define cent-drop-down2 (new choice% [parent panel] ;;Drop-down for end-station
                                [label "To Station     "]
                                [choices cent-stations]))


(define cent-button (new button% [parent panel] ;;Button
                            [label "Let's Go"]
                            [callback (lambda (button event)
                                        (let ([cent-start-station (send cent-drop-down get-string-selection)] ;;Start-station defined
                                              [cent-end-station (send cent-drop-down2 get-string-selection)]) ;;End-station defined
                                              (send cent-result-text set-label (format "From: ~a\nTo: ~a\nTime: ~a minutes\nDistance: ~a miles\n" cent-start-station cent-end-station (cent-time cent-start-station cent-end-station) (cent-distance cent-start-station cent-end-station)))))]))


(define cent-result-text (new message%
                         [parent panel]
[label "

                                                                "])) ;;Message label to display time and distance


(define Lizimage (new message%
                      [parent panel]
                      [label "Central Line Stations Map"]))

(define panel2 (new vertical-panel%
                   [parent panel]
                   [style '(vscroll hscroll)]
                   [min-width 450]	 
   	 	   [min-height 200]))

(define logo2 ;;Central Map
  (read-bitmap (get-pure-port (string->url "https://tubeplan.w3spaces.com/Central-line-map4.png"))))
(define z (new frame% [label "A picture"]))
(void (new message% [parent panel2] [label logo2]))


;;Northern Line GUI
(define NortLine (new message%
                      [parent panel]
                      [label "Northern Line"]))
(define Nort-to (new message%
                      [parent panel]
                      [label "Morden ↔ High Barnet via Bank"]))


(define nort-drop-down (new choice% [parent panel] ;;Drop-down for start-station
                                [label "From Station"]
                                [choices nort-stations]))

(define nort-drop-down2 (new choice% [parent panel] ;;Drop-down for end-station
                                [label "To Station     "]
                                [choices nort-stations]))


(define nort-button (new button% [parent panel] ;;Button
                            [label "Let's Go"]
                            [callback (lambda (button event)
                                        (let ([nort-start-station (send nort-drop-down get-string-selection)] ;;Start-station defined
                                              [nort-end-station (send nort-drop-down2 get-string-selection)]) ;;End-station defined
                                              (send nort-result-text set-label (format "From: ~a\nTo: ~a\nTime: ~a minutes\nDistance: ~a miles\n" nort-start-station nort-end-station (nort-time nort-start-station nort-end-station) (nort-distance nort-start-station nort-end-station)))))]))

(define nort-result-text (new message%
                         [parent panel]
[label "

                                                               "])) ;;Message label to display time and distance


(define nort-map (new message%
                      [parent panel]
                      [label "Northern Line Stations Map"]))

(define panel3 (new vertical-panel%
                   [parent panel]
                   [style '(vscroll hscroll)]
                   [min-width 450]	 
   	 	   [min-height 200]))


(define logo3 ;;Central Map
  (read-bitmap (get-pure-port (string->url "https://tubeplan.w3spaces.com/Northern-line-map1.png"))))
(define n (new frame% [label "A picture"]))
(void (new message% [parent panel3] [label logo3]))






(send frame show #t)





;;Elizabeth Line Code
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


;;Victoria Line Code
(define vic-distances (for/list ([i (in-range (length vic-stations))])
                        (for/list ([j (in-range (length vic-stations))])
                          (if (= i j)
                              0
                              (* 0.5 (abs (- i j)))))))

(define (vic-distance vic-start-station vic-end-station)
  (list-ref (list-ref vic-distances (index-of vic-stations vic-start-station)) (index-of vic-stations vic-end-station)))

(define (vic-time vic-start-station vic-end-station)
  (* (vic-distance vic-start-station vic-end-station) 2))


;;Central Line Code
(define cent-distances (for/list ([i (in-range (length cent-stations))])
                         (for/list ([j (in-range (length cent-stations))])
                           (if (= i j)
                               0
                               (* 0.5 (abs (- i j)))))))

(define (cent-distance cent-start-station cent-end-station)
  (list-ref (list-ref cent-distances (index-of cent-stations cent-start-station)) (index-of cent-stations cent-end-station)))

(define (cent-time cent-start-station cent-end-station)
  (* (cent-distance cent-start-station cent-end-station) 2))


;;Northen Line Code
(define nort-distances (for/list ([i (in-range (length nort-stations))])
                    (for/list ([j (in-range (length nort-stations))])
                      (if (= i j)
                          0
                          (* 0.5 (abs (- i j)))))))

(define (nort-distance nort-start-station nort-end-station)
  (list-ref (list-ref nort-distances (index-of nort-stations nort-start-station)) (index-of nort-stations nort-end-station)))

(define (nort-time nort-start-station nort-end-station)
  (* (nort-distance nort-start-station nort-end-station) 2))



