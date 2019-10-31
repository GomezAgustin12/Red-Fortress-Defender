extends Node2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var speed 
var index 
onready var per = get_node("/root/Datos")
onready var personaje = per.personaje

func _ready():
	print(personaje)
	
func _constructor(aux : int):
	index = aux
	get_node("Sprite").animation= Datos.personaje[index]["Sprite"]
	speed = Datos.personaje[index]["speed"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]

func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Cuerpo_area_entered(area):
	print("Index: ", index)
	if area.name=="Cuerpo":
		get_node("Sprite").animation=personaje[index]["SpriteAtkC"]
		speed=0

	if area.name == "CastleAreaEnemy":
		get_node("Sprite").animation=personaje[index]["SpriteAtkC"]
		speed=0
#
func _on_Atk_area_entered(area):
#	speed=0
	if index == 0:
		var neoDaga = Daga.instance()
		neoDaga.position=position
		get_parent().add_child(neoDaga)

	if index == 1:
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position
		get_parent().add_child(neoFlecha)
