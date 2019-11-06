extends Node2D


var Amigo = preload( "res://Amigo.tscn" )
var Enemigo = preload("res://Enemigo.tscn")


var RelojLeft : bool = false
var RelojRight : bool = false
var LeftUnitChosen =0
var RightUnitChosen =0

func _process(delta):

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
		if Input.is_action_just_pressed("ui_select") :
			CreateUnit(LeftUnitChosen)
	if RelojRight : 
		if Input.is_action_just_pressed("shift") :
			CreateUnit2(RightUnitChosen)


func CreateUnit(unitRef):
	print("UnitRef :",unitRef)
	var unidad = Amigo.instance()
	unidad._constructor(unitRef)
	unidad.set_position($PathA.position)
	get_parent().add_child(unidad)
	RelojLeft = false
	$CreationTime.start(1)

func _creation_ready_timeout():
	RelojLeft = true

func CreateUnit2(unitRef):
	var unidad =Enemigo.instance()
	unidad._constructor(unitRef)
	unidad.set_position($PathE.position)
	get_parent().add_child(unidad)
	RelojRight = false
	$CreationTime2.start(1)

func _creation_ready_timeout2():
	RelojRight = true
