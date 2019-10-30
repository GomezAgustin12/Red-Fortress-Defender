extends Node

onready var per = get_node("/root/PersonajeDatos")
onready var personaje = per.personaje
func _ready():
	print(personaje[0])
