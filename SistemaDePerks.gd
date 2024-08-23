extends Control

var perks_data = []

# Esta función se llama cuando el nodo está listo para ser usado.
func _ready():
	print("Se inicializó script")  # Mensaje para verificar que el script ha sido inicializado
	load_perks()  # Carga los datos de perks desde el archivo JSON
	if perks_data.size() > 0:  # Verifica si los datos de perks fueron cargados correctamente
		create_perk_buttons()  # Crea los botones de perks basados en los datos cargados
	else:
		print("Perks data is empty or not loaded")  # Mensaje en caso de que los datos estén vacíos o no se hayan cargado

# Esta función carga los datos de perks desde un archivo JSON.
func load_perks():
	print("Cargando script")  # Mensaje para indicar que se está cargando el archivo
	var file_path = "res://PerksJSON/PerksJSON.JSON"  # Ruta del archivo JSON
	
	# Intenta abrir el archivo JSON para lectura
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var file_text = file.get_as_text()  # Obtiene el contenido del archivo como texto
		print("Contenido del archivo JSON: ", file_text)  # Muestra el contenido del archivo para verificación

		var json_instance = JSON.new()  # Crea una instancia del parser JSON
		var parse_result = json_instance.parse(file_text)  # Intenta analizar el texto del JSON
		
		if parse_result == OK:  # Verifica si el análisis fue exitoso
			var result = parse_result.result
			if typeof(result) == TYPE_ARRAY:  # Verifica si el resultado es un arreglo
				perks_data = result  # Asigna los datos de perks
				if not perks_data:  # Verifica si no se encontraron datos
					print("No se encontraron datos de perks")
				else:
					print("Datos de perks cargados: ", perks_data)  # Muestra los datos cargados
			else:
				print("El JSON no es una lista válida")  # Mensaje si el JSON no es un arreglo
		else:
			print("Error al analizar JSON: ", json_instance.get_error_message())  # Mensaje de error si el análisis falla
		
		file.close()  # Cierra el archivo después de la lectura
	else:
		print("Error al abrir el archivo: ", file_path)  # Mensaje de error si el archivo no se puede abrir

# Esta función crea botones y etiquetas para cada perk basado en los datos cargados.
func create_perk_buttons():
	clear_perks()  # Limpia los botones y etiquetas existentes antes de crear nuevos
	print("Creando botones de perks...")  # Mensaje para indicar que se están creando los botones
	for perk in perks_data:
		var button = Button.new()  # Crea un nuevo botón
		var label = Label.new()  # Crea una nueva etiqueta

		# Configura el botón
		button.text = "Cost: $" + str(perk["cost"])  # Establece el texto del botón con el costo del perk
		button.connect("pressed", Callable(self, "_on_perk_button_pressed").bind(perk["id"]))  # Conecta la señal "pressed" del botón al método _on_perk_button_pressed

		# Configura la etiqueta
		label.text = perk["name"] + "\n" + perk["description"]  # Establece el texto de la etiqueta con el nombre y la descripción del perk

		# Añade el botón y la etiqueta al Control
		add_child(button)
		add_child(label)
		
		# Posiciona el botón y la etiqueta en la pantalla
		button.rect_min_size = Vector2(150, 30)  # Establece el tamaño mínimo del botón
		label.rect_min_size = Vector2(200, 60)  # Establece el tamaño mínimo de la etiqueta
		button.rect_position = Vector2(10, 10 + perks_data.find(perk) * 40)  # Posiciona el botón
		label.rect_position = Vector2(170, 10 + perks_data.find(perk) * 40)  # Posiciona la etiqueta

# Este método se llama cuando se presiona un botón de perk y muestra los detalles del perk.
func _on_perk_button_pressed(perk_id):
	for perk in perks_data:
		if perk["id"] == perk_id:  # Verifica si el ID del perk coincide con el ID del botón presionado
			print("ID: ", perk["id"])  # Muestra el ID del perk
			print("Nombre: ", perk["name"])  # Muestra el nombre del perk
			print("Descripción: ", perk["description"])  # Muestra la descripción del perk
			print("Costo: $", perk["cost"])  # Muestra el costo del perk
			print("Tipo: ", perk["type"])  # Muestra el tipo del perk
			break

# Esta función elimina todos los botones y etiquetas del Control.
func clear_perks():
	for child in get_children():  # Itera sobre todos los hijos del Control
		if child is Button or child is Label:  # Verifica si el hijo es un botón o una etiqueta
			remove_child(child)  # Elimina el hijo del Control
			child.queue_free()  # Marca el hijo para su liberación de memoria
