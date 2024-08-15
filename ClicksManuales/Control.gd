extends Control

# Variable para contar los clicks.
var puntos: int = 0

# Función que se ejecuta cuando se hace click en el botón.
func _on_button_pressed():
	puntos += 1
	actualizar_puntos()


# Función para actualizar el texto del Label.
func actualizar_puntos():
	print(puntos)

# Conectar la señal del botón correctamente.







