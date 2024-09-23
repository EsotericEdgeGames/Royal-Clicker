extends Node3D



var clicks = 0 
var cps = 1
var cpc: int = 1
var frame = 1


func _physics_process(delta):
	frame += delta
	if frame >= 1:
		clicks+=cps
		frame = 0
		print(clicks) 


# Función que se ejecuta cuando se hace click en el botón.
func boton_presionado():
	clicks += cpc


func menu_presionado():
	get_tree(). change_scene_to_file("res://Escenas/menù.tscn")

func _boton_presionado():
	clicks += cpc
	print(clicks)



