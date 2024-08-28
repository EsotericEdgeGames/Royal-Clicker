extends Node3D


var clicks = 0 
var cps = 0.25 
var segs2 = 0 
var cpc: int = 1


func _process(delta):
	var segs = Time.get_ticks_msec() / 1000
	if segs>segs2:
		clicks += cps 
		segs += 0.25 
		print(clicks)


func _on_button_button_down():
		clicks += cpc
		print(clicks)	
		
	
