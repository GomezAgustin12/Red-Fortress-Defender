extends Node2D

var Daga = preload("res://Daga.tscn")
var speed 
var vida
var index


func _constructor(aux : int):
	index=aux
	$Sprite.animation= Datos.personaje[index]["Sprite"]
	speed = -Datos.personaje[index]["speed"]
	vida = Datos.personaje[index]["vida"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]
	$Cuerpo.nombre_personaje=Datos.personaje[index]["clase"]

func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Cuerpo_area_entered(area):
	print()
	if area.name=="Cuerpo":
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		speed=0

	if area.name == "CastleAreaAmigo":
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		speed=0

func _on_Atk_area_entered(area):
	var neoDaga = Daga.instance()
#	speed=0
	neoDaga.position=position
	neoDaga.speed*=-1
	get_parent().add_child(neoDaga)


