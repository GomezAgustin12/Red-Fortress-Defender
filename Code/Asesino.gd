extends Node2D

var speed = 150
var ataque = 400
var vida = 300



func _process(delta):
	position=position+Vector2(speed*delta, 0)

