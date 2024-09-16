extends Node3D


var clicks = 0 
var cps = 1
var cpc: int = 1
var frame = 1
var cooldown: float = 0.15  # Duración del cooldown en segundos
var tiempo_actual: float = 0.0  # Tiempo acumulado para controlar el cooldown

@onready var boton = $Control/Clicker/Boton  # Refiere al nodo del botón

func _ready():
	boton.pressed.connect(boton_presionado)  # Conectar el botón al evento de presionado


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


