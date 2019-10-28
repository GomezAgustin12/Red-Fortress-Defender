extends Node2D


var speed = 100   
var ataque = 100
var vida = 200


func _process(delta):
	position=position+Vector2(speed*delta, 0)