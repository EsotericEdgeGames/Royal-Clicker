extends Control

func menu_presionado():
	get_tree().change_scene_to_file("res://Escenas/menù.tscn")

func _ready():
	$TextEdit.editable = false 

func _on_menu_pressed():
	menu_presionado()
