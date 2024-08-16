extends Node3D

var clicks = 0 #Varible Clicks que se va a usar en gran parte de los Nodos
var segs = 0 #Varible Segundos para usar con AutoClicker
var x = 0.25 #Variable de Clicks Extras (por el autoclicker) WIP
var segs2 = 0 #Variable que se va a ir comparando con los segundos

# Called when the node enters the scene tree for the first time.
#func _ready():
	#$Label.text = str(clicks) #Click esta en int y se escribe a str par que se vea como texo


func _process(delta):
	var segs = Time.get_ticks_msec() / 1000
	if segs > segs2:
		clicks += x 
		segs += 0.25 
		print(clicks)
