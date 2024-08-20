extends Control


# Variable para contar los clicks.
var puntos: int = 0
var cpc: int = 1


# Función que se ejecuta cuando se hace click en el botón.
func boton_presionado():
	puntos += cpc
	actualizar_puntos()


func actualizar_puntos():
	print(puntos)
# Conectar la señal del botón correctamente.

