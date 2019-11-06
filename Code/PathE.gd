extends Position2D

export var value = 0
var pos=[Vector2(1500, 840), Vector2(1360, 700), Vector2(1300, 575), Vector2(1320, 450), Vector2(1330, 310), Vector2(1370, 180), Vector2(1390, 70)]

func _ready():
	position=pos[0]

func _process(delta):
	if Input.is_action_just_pressed("Arriba") && value < 6:
		if value != 6:
			value +=1
		else:
			position=Vector2(1500, 840)

	if Input.is_action_just_pressed("Abajo") && value > 0:
		value -= 1

	position = pos[value]