extends Area2D

var vida = 3000

func _process(delta):
	if vida < 100:
		get_parent().frame=2
	if vida < 1000:
		get_parent().frame=1
