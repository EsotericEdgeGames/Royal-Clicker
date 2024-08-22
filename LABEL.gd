extends Control

# Exporta las variables para que puedas asignar las etiquetas desde el editor
@export var CPS_label : Label
@export var CPC_label : Label


# Variables para almacenar las estadísticas
var CPS = 0
var CPC = 0


func _ready():
	# Inicializa las etiquetas con los valores iniciales
	actualizar_estadísticas()
	

func actualizar_estadísticas():
	# Actualiza las etiquetas con los valores actuales
	CPS_label.text = "CPS: " + str(CPS_label)
	CPC_label.text = "CPC: " + str(CPC_label)
	

# Métodos para actualizar las estadísticas desde otros scripts
func establecer_CPS(new_CPS: int):
	CPS = new_CPS
	actualizar_estadísticas()
	

func establecer_CPC (new_CPC: int):
	CPC = new_CPC
	actualizar_estadísticas()
