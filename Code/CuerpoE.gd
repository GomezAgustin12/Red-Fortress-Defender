extends Area2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var speed
var vida
var index
var atk_amigo =false
var amigo
var castle
var atk_castle = false
var ataque


func _constructor(aux : int):
	index=aux
	$Sprite.animation= Datos.personaje[index]["Sprite"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]
	
	vida = Datos.personaje[index]["vida"]
	ataque= 10

func _process(delta):
	if atk_amigo and $Sprite.frame==2:
		print(amigo.vida)
		amigo.vida-=ataque
		if amigo.vida<=0:
			atk_amigo=false

	if vida<=0:
		atk_amigo=false
		$Sprite.animation="asesinoMuerte"
		if $Sprite.frame==5:
			get_parent().queue_free()

	if atk_castle and $Sprite.frame==2:
		print(castle.vida)
		castle.vida-=ataque
		if castle.vida<=0:
			atk_castle=false
		

func _on_Cuerpo_area_entered(area):

	if area.name=="CuerpoA":
		amigo=area
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		get_parent().speed=0
		atk_amigo=true

	if area.name == "CastleAreaAmigo":
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		get_parent().speed=0
		castle=area
		atk_castle=true
		

func _on_Atk_area_entered(area):
	if index== 0:
		$Sprite.animation=Datos.personaje[index]["SpriteDist"]
		get_parent().speed=0
		var neoDaga = Daga.instance()
		neoDaga.position=position
		neoDaga.speed*=-1
		get_parent().add_child(neoDaga)
	
	if index == 1:
		$Sprite.animation=Datos.personaje[index]["SpriteDist"]
		get_parent().speed=0
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position
		neoFlecha.speed*=-1
		get_parent().add_child(neoFlecha)
		neoFlecha.get_node("Sprite").flip_h=true
	pass

func _on_CuerpoE_area_exited(area):
	if area.name=="CuerpoA" or area.name=="CastleAreaAmigo":
		get_parent().speed= -Datos.personaje[index]["speed"]
		$Sprite.animation= Datos.personaje[index]["Sprite"]


func _on_Atk_area_exited(area):
	if area.name=="CuerpoA" or area.name=="CastleAreaAmigo":
		get_parent().speed= -Datos.personaje[index]["speed"]
		$Sprite.animation= Datos.personaje[index]["Sprite"]
