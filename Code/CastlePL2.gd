extends AnimatedSprite
var vida = 3000

func _process(delta):
	if vida < 100:
		frame=2
	if vida < 3000:
		frame=1