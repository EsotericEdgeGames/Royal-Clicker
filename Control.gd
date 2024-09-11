extends Control


# Variable para contar los clicks.
var puntos: int = 0
var cpc: int = 1

# Para controlar si el botón está habilitado.
var boton_habilitado: bool = true  # Para controlar si el botón está habilitado.

@onready var timer = $Timer 
@onready var boton = $Button  

func _listo():
	timer.wait_time = 0.20  # Tiempo de espera de 0.20 segundos
	timer.one_shot = true   # Solo se ejecuta una vez cada vez que se activa
	timer.timeout.connect(_enfriamiento_finalizado)  # Conectar la señal de timeout del timer

# Función que se ejecuta cuando se hace click en el botón.
func boton_presionado():
	if boton_habilitado:  # Solo permite el click si el botón está habilitado
		puntos += cpc
		actualizar_puntos()
		boton_habilitado = false  # Deshabilita el botón
		boton.disabled = true
		timer.start()  # Inicia el temporizador de 0.20 segundos

# Función que se ejecuta cuando el temporizador ha finalizado.
func _enfriamiento_finalizado():
	boton_habilitado = true  # Habilita el botón de nuevo
	boton.disabled = false


func actualizar_puntos():
	print(puntos)

