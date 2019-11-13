extends Control


func _on_empezar_pressed():
	get_tree().change_scene("res://Mapa.tscn")


func _on_salir_pressed():
	get_tree().quit()
