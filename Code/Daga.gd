extends Node2D

var speed=300
var damage=20

func _ready():
	position=position+Vector2(50, 0)

func _process(delta):
	position=position+Vector2(speed*delta, 0)

func _on_Area2D_area_entered(area):
	if area.name!= "Atk" and area.name!="Daga":
		area.vida-=20
		queue_free()
