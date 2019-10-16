extends Position2D

var killerRef  = preload("res://Asesino.tscn")
var flag=false
var asesino : Node2D

func _ready():
	pass

func _process(delta):
	if flag && Input.is_action_just_pressed("mouse_action") :
#		var mouse=get_viewport().get_mouse_position()
		asesino = killerRef.instance()
		print("instanciado")
		asesino.set_position( Vector2.ONE * 15)
		get_parent().add_child(asesino)

#func _input(event):
#	if event.

func _asesino_timeout():
	flag = true
	pass # Replace with function body.
