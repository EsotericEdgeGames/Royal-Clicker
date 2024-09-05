extends Node3D


var clicks = 0 
var cps = 1
var segs2 = 0 
var cpc: int = 1
var falso_delta= 0


func _process(delta):
	falso_delta += delta
	if falso_delta >= 1:
		clicks+=cps
		falso_delta = 0
		print(clicks)


func menu_presionado():
	get_tree(). change_scene_to_file("res://Escenas/menù.tscn")

func _boton_presionado():
		clicks += cpc
		print(clicks)

