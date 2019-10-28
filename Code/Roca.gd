extends Node2D

var speed = 50
var ataque = 300
var vida = 1000


func _process(delta):
	position=position+Vector2(speed*delta, 0)
