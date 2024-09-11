extends Control


func quit_pressionado():
	get_tree(). quit()

func credits_presionado():
	get_tree(). change_scene_to_file("res://Escenas/creditos.tscn")

func options_presionado():
	get_tree(). change_scene_to_file("res://Escenas/options.tscn")

func practice_presionado():
	get_tree(). change_scene_to_file("res://Escenas/node_3d.tscn")


func play_presionado():
	get_tree(). change_scene_to_file("res://Escenas/server_list.tscn")
