extends Node3D


var clicks: int = 0
var cps = 1
var cpc: int = 1
var frame = 1
var cooldown: float = 0.15  # Duración del cooldown en segundos
var tiempo_actual: float = 0.0  # Tiempo acumulado para controlar el cooldown

@onready var boton = $Control/Clicker/Boton  # Refiere al nodo del botón

func _ready():
	boton.pressed.connect(boton_presionado)  # Conectar el botón al evento de presionado
	var numbers = [999, 999999, 1500000, 2500000000, 12500000, 2600000000000000, 3800000000000]
	for clicks in numbers:
		print(_sistema_de_redondeo_de_numeros(clicks))


func _physics_process(delta):
	frame += delta
	if frame >= 1:
		clicks+=cps
		frame = 0
		print(clicks) 
	control_de_cooldown(delta)

func control_de_cooldown(delta):
		if boton.disabled:
			tiempo_actual += delta  # Acumular el tiempo transcurrido
		if tiempo_actual >= cooldown:  # Si pasa el tiempo del cooldown
			boton.disabled = false  # Activar el botón visualmente
			tiempo_actual = 0.0  # Reiniciar el tiempo acumulado


# Función que se ejecuta cuando se hace click en el botón.
func boton_presionado():
	if not boton.disabled:  # Solo se puede presionar si el botón está habilitado
		clicks += cpc
		print(clicks)
		boton.disabled = true  # Desactivar botón visualmente


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


