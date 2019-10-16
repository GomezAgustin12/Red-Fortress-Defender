extends Node2D


var killerRef  = preload("res://Asesino.tscn")
var flag : bool = false



func _ready():
	pass

func _process(delta):
	$Label.text = str(get_viewport().get_mouse_position()) 
	
	if flag : 
		if Input.is_action_just_pressed("mouse_action") :
			var wayHeight : int = int(get_viewport_rect().size.y / 7 )
			var indice = int(get_viewport().get_mouse_position().y / wayHeight)
			CreateUnit( killerRef, Vector2( 64, 64 + ( wayHeight * indice) ) )


func CreateUnit(unitRef, origin):
	var asesino = unitRef.instance()
	asesino.set_position( origin)
	get_parent().add_child(asesino)
	flag = false
	$CreationTime.start(3)


func _creation_ready_timeout():
	flag = true
	pass # Replace with function body.
