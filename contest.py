from turtle import *
from math import sqrt
speed(0)
penup()
setx(0)
sety(-100)

def hax(size, level):
	if level == 1:
		pendown()
		for i in range(0, 6):		
			forward(size)
			left(60)
	else:
		for i in range(0, 3):
			hax(size / 2, level - 1)
			forward(size)
			left(60)
			forward(size)
			left(60)


# hax(200, 2)

def triangle(size, level):
	if level == 1:
		pendown()
		forward(size)
		forward(0 - size)
		penup()
	else:
		for i in range(0, 3):
			triangle(size / 2, level - 1)
			forward(size)
			left(120)

# triangle(500, 7)

def map1(size, level):
	if level == 1:
		pendown()
		for i in range(0, 90):
			forward(size)
			left(size)

map1(100, 1)



# def helper(size, level):
# 	if level == 1:
# 		for i in range(0, 5):
# 			forward(size)
# 			left(90)
# 	else:
# 		begin_fill()
# 		for i in range(0, 5):
# 			forward(((size / sqrt(8)) * (sqrt(2) / 2)) / 2)
# 			left(45)
# 			helper((size / sqrt(8)), level - 1)
# 			right(45)
# 			forward((size / sqrt(8)) * (sqrt(2) / 2))
# 			left(45)
# 			helper((size / sqrt(8)), level - 1)
# 			right(45)
# 			forward(((size / sqrt(8)) * (sqrt(2) / 2)) / 2)
# 			left(90)

# helper(500, 4)



