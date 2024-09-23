class_name Gameplay
extends Control 

@export var CPC_label: Label 
@export var CPS_label: Label 
@export var total_clicks: Label

var CPS: int = 1  # Clics por segundo
var CPC: int = 1  # Clics por clic
var clicks: int = 0  # Total de clics
var total_clicks_count: int = 0  # Total de clics en pantalla 
var time_accumulator: float = 0.0  # Acumulador de tiempo

func _ready() -> void:
	update_CPC_label_text()
	update_CPS_label_text()

func _physics_process(delta: float) -> void:
	time_accumulator += delta  # Aumenta el acumulador de tiempo
	if time_accumulator >= 1.0:  # Cada segundo
		apply_CPS()  # Aplicar CPS
		time_accumulator = 0.0  # Reiniciar el acumulador


func apply_CPS() -> void:
	clicks += CPS
	update_total_clicks()  # Actualizar total de clics


func create_CPC_label() -> void:
	clicks += CPC
	update_CPC_label_text()
	update_total_clicks()  # Actualizar total de clics


func update_CPC_label_text() -> void:
	if CPC_label:
		CPC_label.text = "CPC: %s" % CPC
	else:
		print("CPC_label no está asignado.")


func update_CPS_label_text() -> void:
	if CPS_label:
		CPS_label.text = "CPS: %s" % CPS
	else:
		print("CPS_label no está asignado.")


func update_total_clicks() -> void:
	total_clicks_count = clicks  # Actualizar el total de clics
	if total_clicks:
		total_clicks.text = "Total Clicks: %s" % total_clicks_count
	else:
		print("total_clicks no está asignado.")


func _on_boton_pressed() -> void:
	create_CPC_label()  # Sumar CPC al hacer clic
	# No sumar CPS aquí, solo aplicar CPS cada segundo
