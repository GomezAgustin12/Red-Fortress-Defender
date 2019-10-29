extends Node2D

var speed = 150
var ataque = 400
var vida = 300

var Daga=preload("res://Code/Daga.tscn")

func _process(delta):
	position=position+Vector2(speed*delta, 0)



func _on_Area2D_area_entered(area):
	print(area.name)
	if area.name=="Cuerpo":
		get_node("Sprite").animation="ataque"
		speed=0
	


func _on_Atk_area_entered(area):
	var neoDaga = Daga.instance()
	neoDaga.position=position
	get_parent().add_child(neoDaga)
