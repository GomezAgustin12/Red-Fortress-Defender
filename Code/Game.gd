extends Node2D


var asesino = preload("res://Asesino.tscn")
var archer = preload("res://Arquero.tscn")
var roca = preload("res://Roca.tscn")

onready var Unidades = [asesino, archer, roca]


var RelojLeft : bool = false
var RelojRight : bool = false
var LeftUnitChosen =0
var RightUnitChosen =0



func _process(delta):
	$Label.text = str(get_viewport().get_mouse_position()) 

	if Input.is_action_just_pressed("Create1"):
		LeftUnitChosen = 0
	if Input.is_action_just_pressed("Create2"):
		LeftUnitChosen = 1
	if Input.is_action_just_pressed("Create3"):
		LeftUnitChosen = 2

	if Input.is_action_just_pressed("create1"):
		RightUnitChosen = 0
	if Input.is_action_just_pressed("create2"):
		RightUnitChosen = 1
	if Input.is_action_just_pressed("create3"):
		RightUnitChosen = 2
	
	
	if RelojLeft : 
		if Input.is_action_just_pressed("mouse_action") :
			var wayHeight : int = int(get_viewport_rect().size.y / 7 )
			var indice = int(get_viewport().get_mouse_position().y / wayHeight)
			print(str(Unidades[LeftUnitChosen]))
			CreateUnit( Unidades[LeftUnitChosen], Vector2( 250, 64 + ( wayHeight * indice) ) )

	if RelojRight : 
		if Input.is_action_just_pressed("mouse_action2") :
			var wayHeight : int = int(get_viewport_rect().size.y / 7 )
			var indice = int(get_viewport().get_mouse_position().y / wayHeight)
			print(str(Unidades[RightUnitChosen]))
			CreateUnit2( Unidades[RightUnitChosen], Vector2( 1300, 64 + ( wayHeight * indice) ) )




func CreateUnit(unitRef, origin):
	var unidad = unitRef.instance()
	unidad.set_position( origin)
	
	get_parent().add_child(unidad)
	RelojLeft = false
	$CreationTime.start(3)


func _creation_ready_timeout():
	RelojLeft = true



func CreateUnit2(unitRef, origin):
	var unidad = unitRef.instance()
	unidad.set_position( origin)
	unidad.speed *= -1
	get_parent().add_child(unidad)
	unidad.get_node("Sprite").flip_h = true
	RelojRight = false
	$CreationTime2.start(3)
	


func _creation_ready_timeout2():
	RelojRight = true


