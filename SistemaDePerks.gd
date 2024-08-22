extends Control

var perks_data = [] 
"""
	Se almacenarán los datos de las perks 
	después de cargarlos desde el archivo JSON.

"""

func _ready():
	load_perks()
	create_perk_buttons()

func load_perks():
	var file = FileAccess.open("res://PerksJSON/PerksJSON.JSON", FileAccess.READ)
	# Abre el archivo perks.json en modo lectura (FileAccess.READ).
	
	if file != null:
		# Verifica que el archivo se abrió correctamente.
		
		var json_instance = JSON.new()
		var parse_result = json_instance.parse(file.get_as_text())
		# Parsea el contenido del archivo JSON.
		
		if parse_result.error == OK:
			perks_data = parse_result.result
			# Si no hubo errores en el parseo, guarda los datos del JSON en el array perks_data.
			
		file.close()
# Se encarga de cargar los datos de las perks desde un archivo JSON.

func create_perk_buttons():
	for perk in perks_data:
		var button = Button.new()
		# Crea un nuevo botón.
		
		button.text = "Cost: $" + str(perk["cost"])
		# Establece el texto del botón con el costo de la perk.
		
		button.connect("pressed", Callable(self, "_on_perk_button_pressed").bind(perk["id"]))
		# Conecta la señal pressed del botón a la función _on_perk_button_pressed, pasando el id de la perk como parámetro.

		var label = Label.new()
		# Crea una nueva etiqueta.
		
		label.text = perk["name"] + "\n" + perk["description"]
		# Establece el texto de la etiqueta con el nombre y la descripción de la perk.
		

		add_child(button)
		add_child(label)
		# Agrega el botón y la etiqueta como hijos del nodo actual (el Control). 
 
# Recorre cada perk en perks_data y crea un botón y una etiqueta para ella.


func _on_perk_button_pressed(perk_id):
	for perk in perks_data:
		# Recorre todas las perks.
		
		if perk["id"] == perk_id:
			# Busca la perk con el ID que coincide con el que se pasó al presionar el botón.
			
			print("ID: ", perk["id"])
			print("Nombre: ", perk["name"])
			print("Descripción: ", perk["description"])
			print("Costo: $", perk["cost"])
			print("Tipo: ", perk["type"])
			# print(): Imprime en la consola la información de la perk seleccionada.
			break
			 
	# Se ejecuta cuando se presiona un botón de perk.

func clear_perks():
	for child in get_children():
		# Obtiene todos los nodos hijos del Control.
		
		if child is Button or child is Label:
			remove_child(child)
			# Remueve el nodo hijo del árbol de la escena.
			
			child.queue_free()
			# Marca el nodo para que se libere de la memoria.

# Se encarga de limpiar todos los botones y etiquetas que se crearon.
