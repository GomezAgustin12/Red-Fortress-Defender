extends Node2D

var speed=250

func _process(delta):
	position=position+Vector2(speed*delta, 0)

