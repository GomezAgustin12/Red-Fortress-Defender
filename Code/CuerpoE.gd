extends Area2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var Piedra = preload("res://Piedra.tscn")
var speed
var vida
var index 

func _constructor(aux : int):
	index=aux
	$Sprite.animation= Datos.personaje[index]["Sprite"]
	$Sprite.flip_h=true
	vida = Datos.personaje[index]["vida"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]

func _on_Cuerpo_area_entered(area):
	print()
	if area.name=="Cuerpo":
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		get_parent().speed=0

	if area.name == "CastleAreaAmigo":
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		get_parent().speed=0

func _on_Atk_area_entered(area):
	if index== 0:	
		var neoDaga = Daga.instance()
#		speed=0
		neoDaga.position=position
		neoDaga.speed*=-1
		get_parent().add_child(neoDaga)
	
	if index == 1:
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position
		neoFlecha.speed*=-1
		get_parent().add_child(neoFlecha)
		neoFlecha.get_node("Sprite").flip_h=true
	
	if index == 2:
		var neoPiedra = Piedra.instance()
		neoPiedra.position=position
		neoPiedra.speed*=-1
		get_parent().add_child(neoPiedra)
		neoPiedra.get_node("Sprite").flip_h=true