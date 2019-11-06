extends Node2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var Enemigo = preload("res://Enemigo.tscn")
var speed
var vida
var index 
	
func _constructor(aux : int):
	index = aux
	$Sprite.animation= Datos.personaje[index]["Sprite"]
	speed = Datos.personaje[index]["speed"]
	vida = Datos.personaje[index]["vida"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]

func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Cuerpo_area_entered(area):
	if area.name=="Cuerpo":
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		speed=0
		print(area.nombre_personaje)
		
	if area.name == "CastleAreaEnemy":
		get_node("Sprite").animation=Datos.personaje[index]["SpriteAtkC"]
		speed=0
#
func _on_Atk_area_entered(area):
	if index == 0:
		var neoDaga = Daga.instance()
		neoDaga.position=position
		get_parent().add_child(neoDaga)

	if index == 1:
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position
		get_parent().add_child(neoFlecha)
