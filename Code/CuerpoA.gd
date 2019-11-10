extends Area2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var speed
var vida
var index 
var ataque
var enemigo
var castle
var time_flechas=false
var atk_flecha=false
var atk_daga=false
var time_daga=false
var atk_enemigo=false
var atk_castle= false


func _constructor(aux : int):
	index = aux
	$Sprite.animation= Datos.personaje[index]["Sprite"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]
	
	vida = Datos.personaje[index]["vida"]
	ataque=10

func _process(delta):
	if atk_enemigo and $Sprite.frame==2:
		enemigo.vida-=ataque
		if enemigo.vida<=0:
			atk_enemigo=false

	if vida<=0:
		$Sprite.animation="asesinoMuerte"
		if $Sprite.frame==5:
			get_parent().queue_free()
			
	if atk_castle and $Sprite.frame==2:
		print(castle.vida)
		castle.vida-=ataque
		if castle.vida<=0:
			atk_castle=false
		
	if atk_daga and time_daga:
		var neoDaga = Daga.instance()
		neoDaga.position=position
		get_parent().add_child(neoDaga)
		time_daga=false
		$Time_daga.start(0.5)
		
	
	if atk_flecha and time_flechas:
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position
		get_parent().add_child(neoFlecha)
		time_flechas=false
		$Time_flechas.start(0.5)

			

func _on_Atk_area_entered(area):
	if index == 0:
		$Sprite.animation=Datos.personaje[index]["SpriteDist"]
		get_parent().speed=0
		atk_daga=true


	if index == 1:
		$Sprite.animation=Datos.personaje[index]["SpriteDist"]
		get_parent().speed=0
		atk_flecha=true

		
	pass
	
func _on_Atk_area_exited(area):
	if area.name=="CuerpoE" or area.name == "CastleAreaEnemy":
		get_parent().speed= Datos.personaje[index]["speed"]
		$Sprite.animation= Datos.personaje[index]["Sprite"]

func _on_Cuerpo_area_entered(area):
	if area.name=="CuerpoE":
		enemigo=area
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		get_parent().speed=0
		atk_enemigo=true
		
	if area.name == "CastleAreaEnemy":
		castle=area
		$Sprite.animation=Datos.personaje[index]["SpriteAtkC"]
		$Sprite.speed_scale=1.5
		get_parent().speed=0
		atk_castle=true

func _on_Cuerpo_area_exited(area):
	if area.name=="CuerpoE" or area.name == "CastleAreaEnemy":
		get_parent().speed= Datos.personaje[index]["speed"]
		$Sprite.animation= Datos.personaje[index]["Sprite"]

func _on_Timer_timeout():
	time_flechas=true

func _on_Time_daga_timeout():
	time_daga=true
