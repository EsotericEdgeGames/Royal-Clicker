extends Control




func _on_play_pressed():
	get_tree(). change_scene_to_file("res://server_list.tscn")


func _on_practice_pressed():
	get_tree(). change_scene_to_file("res://node_3d.tscn")


func _on_options_pressed():
	get_tree(). change_scene_to_file("res://options.tscn")


func _on_credits_pressed():
	get_tree(). change_scene_to_file("res://creditos.tscn")


func _on_quit_pressed():
	get_tree(). quit()

