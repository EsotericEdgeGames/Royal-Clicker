extends Node3D



var clicks: int = 0
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


func _sistema_de_redondeo_de_numeros(value: int) -> String:
	if value >= 1000000000000000:
		return str(floor(value / 1000000000000000.0 * 100) /100) + "C"
	elif value >= 1000000000000:
		return str(floor(value / 1000000000000.0 * 100) / 100) + "T"
	elif value >= 1000000000:
		return str(floor(value / 1000000000.0 * 100) / 100) + "B"
	elif value >= 1000000:
		return str(floor(value / 1000000.0 * 100) / 100) + "M"
	elif value >= 1000:
		return str(floor(value / 1000.0 * 10) / 10) + "K"
	else:
		return str(value)

func _ready():
	var numbers = [999, 999999, 1500000, 2500000000, 12500000, 2600000000000000, 3800000000000]
	for clicks in numbers:
		print(_sistema_de_redondeo_de_numeros(clicks))

