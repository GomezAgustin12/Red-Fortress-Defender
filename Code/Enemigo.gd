extends Node2D

var Daga = preload("res://Daga.tscn")
var speed 


func _constructor(index : int):
	get_node("Sprite").animation= Datos.personaje[index]["Sprite"]
	speed = -Datos.personaje[index]["speed"]
	print(Datos.personaje[1]["clase"])
	print("Index :", index)

func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Cuerpo_area_entered(area):
	print(area.name)
	if area.name=="Cuerpo":
		get_node("Sprite").animation="asesinoAtk"
		speed=0

func _on_Atk_area_entered(area):
	var neoDaga = Daga.instance()
#	speed=0
	neoDaga.position=position
	neoDaga.speed*=-1
	get_parent().add_child(neoDaga)
