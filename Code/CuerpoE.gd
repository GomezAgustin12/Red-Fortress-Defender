extends Area2D

var Daga = preload("res://Daga.tscn")
var Flecha = preload("res://Flecha.tscn")
var speed
var vida
var index
var atk_amigo =false
var amigo
var castle
var aux
var time_atk=false
var time_flechas=false
var atk_flecha=false
var atk_daga=false
var time_daga=false
var atk_castle = false
var muerto : bool = false
var ataque


func _constructor(aux : int):
	index=aux
	$Sprite.animation= Datos.personaje[index]["Sprite"]
	$Sprite.scale.x=Datos.personaje[index]["escaladoX"]
	$Sprite.scale.y=Datos.personaje[index]["escaladoY"]
	
	vida = Datos.personaje[index]["vida"]
	ataque= Datos.personaje[index]["atkC"]
	_reset()

func _reset():
	time_atk=false
	time_flechas=false
	atk_flecha=false
	atk_daga=false
	time_daga=false
	atk_castle = false
	muerto = false

func _process(delta):
	_vida()
	_atk_cuerpo_vs_cuerpo()
	_atk_cuerpo_vs_castillo()
	if atk_daga and time_daga:
		_atk_daga()
	
		 
	GUI.logs( str(get_parent().speed) )

func _atk_daga():
		var neoDaga = Daga.instance()
		neoDaga.position=position - Vector2(100, 0)
		neoDaga.speed*=-1
		get_parent().add_child(neoDaga)
		time_daga=false
		$Time_daga.start(0.5)
#		if aux != null and (aux.name=="CuerpoA" or aux.name == "CastleAreaAmigo"):
#			if aux.vida<=0:
#				atk_daga=false
		
func _atk_flecha():
	if atk_flecha and time_flechas:
		var neoFlecha = Flecha.instance()
		neoFlecha.position=position - Vector2(100, 0)
		neoFlecha.speed*=-1
		get_parent().add_child(neoFlecha)
		neoFlecha.get_node("Sprite").flip_h=true
		time_flechas=false
		$Time_flechas.start(0.5)
		if aux.vida<=0:
			atk_daga=false

func _on_Atk_area_entered(area):
	if area.name == "CuerpoA" or area.name == "CastleAreaAmigo" :
		if index== 0:
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
	if area.name=="CuerpoA" or area.name=="CastleAreaAmigo":
		get_parent().speed= -Datos.personaje[index]["speed"]
		print(area.name, " ", get_parent().name, -Datos.personaje[index]["speed"])
		$Sprite.animation= Datos.personaje[index]["Sprite"]
		_reset()


func _on_Time_flecha_timeout():
	time_flechas=true

func _on_Time_daga_timeout():
	time_daga=true

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

func _on_CuerpoE_area_exited(area):
	if area.name=="CuerpoA" or area.name=="CastleAreaAmigo":
		get_parent().speed= -Datos.personaje[index]["speed"]
		$Sprite.animation= Datos.personaje[index]["Sprite"]



func _atk_cuerpo_vs_cuerpo():
	if atk_amigo and time_atk:
		print("Vida Enemigo ", vida)
		amigo.vida-=ataque
		$Time_atk.start(0.5)
		time_atk=false
		if amigo.vida<=0:
			atk_amigo=false

func _atk_cuerpo_vs_castillo():
	if atk_castle and time_atk:
		castle.vida-=ataque
		$Time_atk.start(0.5)
		time_atk=false
		if castle.vida<=0:
			atk_castle=false



func _vida():
	if vida<=0 and not muerto: 
		get_parent().queue_free()
#		print(vida)
#		muerto = true
#		$Sprite.animation=Datos.personaje[index]["SpriteMuerte"]
#	if muerto and ($Sprite.frame==Datos.personaje[index]["ultimoFrame"] :
		

func _on_Time_atk_timeout():
	time_atk=true
