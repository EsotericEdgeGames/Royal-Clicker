extends Node3D

var clicks = 0 
var cps = 0.25 
var segs2 = 0 


func _process():
	var segs = Time.get_ticks_msec() / 1000
	if segs > segs2:
		clicks += cps 
		segs += 0.25 
		print(clicks)
