class_name Gameplay
extends Control 


@export var CPC_label : Label 
@export var CPS_label : Label 

var CPS : int = 0
var CPC : int = 0


func create_CPS_label() -> void:
	CPS += 1
	update_CPS_label_text()

func create_CPC_label() -> void:
	CPC += 1
	update_CPC_label_text()

func update_CPC_label_text() -> void:
	if CPC_label:
		CPC_label.text = "CPC : %s" % CPC
	else:
		print("CPC_label no está asignado.")

func update_CPS_label_text() -> void:
	if CPS_label:
		CPS_label.text = "CPS : %s" % CPS
	else:
		print("CPS_label no está asignado.")

func _on_boton_pressed() -> void:
	create_CPS_label()
	create_CPC_label()
