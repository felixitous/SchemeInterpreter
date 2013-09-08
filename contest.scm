;HAIKU

;Haikus are easy
;But sometimes they don't make sense
;Refrigerator


;Begin Artwork
(speed 0) ;refrigerator
(penup)
(setposition -200 -300) 
(pendown)
(forward 400) ;rectangle main body
(right 90)
(forward 289)
(right 90)
(forward 400)
(right 90)
(forward 289)
(right 90)
(forward 400) ;3D backing
(right 30)
(forward 70)
(right 60)
(forward 289)
(right 120)
(forward 70) ;stretch lines 
(left 30)
(forward 400)
(left 150)
(forward 70)
(left 30)
(forward 400) ;farthest back
(left 150)
(forward 70)
(left 30)
(forward 170)
(right 90) ;draw fridge divide
(forward 289)
(right 90) ;darkening
(forward 2)
(right 90)
(forward 289)
(forward -30) ;handles
(left 90)
(penup)
(forward 15)
(pendown)
(begin_fill) ;handle 1
(forward 40)
(right 90)
(forward 10)
(right 90)
(forward 40)
(right 90)
(forward 10)
(end_fill)
(left 90)
(penup)
(forward 34)
(pendown)
(begin_fill) ;handle 1
(forward 40)
(left 90)
(forward 10)
(left 90)
(forward 40)
(left 90)
(forward 10)
(end_fill)
(penup)

(setposition -300 -200)

(right 90)
(pendown)

;left tree
(define (tree size level)
	(cond ((= level 1) 
			(forward size)
			(forward (* size -1)))
		(else 
			(forward size)
			(left 40)
			(tree (* size 0.8) (- level 1))
			(right 50)
			(tree (* size 0.8) (- level 1))
			(left 10)
			(forward (* size -1))


			)))

(color 'darkgreen)
(tree 120 13)
(penup)

(setposition 230 -200)
(pendown)

;right tree
(define (tree2 size level)
	(cond ((= level 1) 
			(forward size)
			(forward (* size -1)))
		(else 
			(forward size)
			(right 40)
			(tree2 (* size 0.8) (- level 1))
			(left 50)
			(tree2 (* size 0.8) (- level 1))
			(right 10)
			(forward (* size -1))


			)))
(tree2 120 13)

(penup)
(setposition -500 -500)
