extends Node2D

var speed=300

func _process(delta):
	position=position+Vector2(speed*delta, 0)

