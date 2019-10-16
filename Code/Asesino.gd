extends Node2D

var speed = 250

func _ready():
	pass # Replace with function body.


func _process(delta):
	position=position+Vector2(speed*delta, 0)
	if Input.is_key_pressed(KEY_0):
		position=position+Vector2(0, 22)

	
