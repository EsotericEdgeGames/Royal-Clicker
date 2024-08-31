extends Node3D


# Called when the node enters the scene tree for the first time.
func _on_Button_input_event(camera, event, clicked_pos, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
