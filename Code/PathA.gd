extends Position2D

export var value = 0
var pos=[Vector2(170, 840), Vector2(240, 700), Vector2(260, 575), Vector2(260, 450), Vector2(330, 310), Vector2(240, 180), Vector2(240, 70)]

func _ready():
	position=pos[0]

func _process(delta):
	if Input.is_action_just_pressed("Key_w") && value < 6:
		if value != 6:
			value +=1
		else:
			position=Vector2(1500, 840)

	if Input.is_action_just_pressed("Key_s") && value > 0:
		value -= 1

	position = pos[value]