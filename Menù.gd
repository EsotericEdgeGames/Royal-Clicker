extends Control


func quit_pressionado():
	get_tree(). quit()

func credits_presionado():
	get_tree(). change_scene_to_file("res://creditos.tscn")

func options_presionado():
	get_tree(). change_scene_to_file("res://options.tscn")

func practice_presionado():
	get_tree(). change_scene_to_file("res://node_3d.tscn")


func play_presionado():
	get_tree(). change_scene_to_file("res://server_list.tscn")
