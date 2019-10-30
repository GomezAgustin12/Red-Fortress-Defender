extends Node2D

var Daga = preload("res://Code/Daga.tscn")
var speed 
var index 
onready var per = get_node("/root/PersonajeDatos")
onready var personaje = per.personaje

func _ready():
	print(personaje)
	
func _constructor(aux : int):
	index = aux
	get_node("Sprite").animation= PersonajeDatos.personaje[index]["Sprite"]
	speed = PersonajeDatos.personaje[index]["speed"]

func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Cuerpo_area_entered(area):
	print("Index: ", index)
	if area.name=="Cuerpo":
		get_node("Sprite").animation=personaje[index]["SpriteAtkC"]
		speed=0

func _on_Atk_area_entered(area):
#	speed=0
	var neoDaga = Daga.instance()
	neoDaga.position=position
	get_parent().add_child(neoDaga)

