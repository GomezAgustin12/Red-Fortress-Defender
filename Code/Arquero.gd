extends Node2D


var speed = 100   
var ataque = 100
var vida = 200


func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Area2D_area_entered(area):
	print(area.name)
	if area.name=="Cuerpo":
		get_node("Sprite").stop()
		speed=0