extends Area2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var speed
var vida
var index 
var ataque
var enemigo
var aux
var castle
var time_atk=false
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
	ataque=Datos.personaje[index]["atkC"]

func _process(delta):
	_vida()
	_atk_cuerpo_vs_cuerpo()
	_atk_cuerpo_vs_castillo()
	if atk_daga and time_daga:
		_atk_daga()
		
func reset():
	time_atk=false
	time_flechas=false
	atk_flecha=false
	atk_daga=false
	time_daga=false
	atk_enemigo=false
	atk_castle= false
		
func _atk_daga():
	var neoDaga = Daga.instance()
	neoDaga.position=position
	get_parent().add_child(neoDaga)
	time_daga=false
	$Time_daga.start(0.5)
#	if aux.name=="CuerpoE" or aux.name == "CastleAreaEnemy":
#		if aux.vida<=0:
#			atk_daga=false

func _atk_flecha():
	if atk_flecha and time_flechas:
		if aux.name!= "Atk" and aux.name!="Daga": print(aux.vida)
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position
		get_parent().add_child(neoFlecha)
		time_flechas=false
		$Time_flechas.start(0.5)
		if aux.name!= "Atk" and aux.name!="Daga":
			if aux.vida<=0:
				atk_flecha=false

func _on_Atk_area_entered(area):
	if area.name == "CuerpoE" or area.name == "CastleAreaEnemy" :
		if index == 0:
			$Sprite.animation=Datos.personaje[index]["SpriteDist"]
			get_parent().speed=0
			atk_daga=true
			aux=area
	
		if index == 1:
			$Sprite.animation=Datos.personaje[index]["SpriteDist"]
			get_parent().speed=0
			atk_flecha=true
			aux=area
	pass

func _on_Atk_area_exited(area):
	if area.name=="CuerpoE" or area.name == "CastleAreaEnemy":
		get_parent().speed= Datos.personaje[index]["speed"]
		$Sprite.animation= Datos.personaje[index]["Sprite"]
		reset()

func _on_Timer_timeout():
	time_flechas=true

func _on_Time_daga_timeout():
	time_daga=true

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

func _atk_cuerpo_vs_cuerpo():
	if atk_enemigo and time_atk:
		print("Vida Amigo: ", vida)
		enemigo.vida-=ataque
		$Time_atk.start(0.5)
		time_atk=false
		if enemigo.vida<=0:
			atk_enemigo=false

func _atk_cuerpo_vs_castillo():
	if atk_castle and time_atk:
		castle.vida-=ataque
		$Time_atk.start(0.5)
		time_atk=false
		if castle.vida<=0:
			atk_castle=false

var muerto : bool = false

func _vida():
	if vida<=0 and not muerto: get_parent().queue_free()
#		print(vida)
#		muerto=true
#		$Sprite.animation=Datos.personaje[index]["SpriteMuerte"]
#	if muerto and $Sprite.frame == Datos.personaje[index]["ultimoFrame"]:
#		get_parent().queue_free()

func _on_Time_atk_timeout():
	time_atk=true
