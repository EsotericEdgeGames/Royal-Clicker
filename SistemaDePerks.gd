extends Control

var perks_data = []  # Almacena los datos de perks cargados desde el archivo JSON

# Se llama cuando el nodo está listo para ser usado.
func _ready():
	print("Se inicializó script")
	load_perks()  # Carga los datos de perks desde el archivo JSON
	if perks_data.size() > 0:  # Verifica si los datos se cargaron correctamente
		clasificar_perks()
		create_perk_buttons()  # Crea los botones de perks en la interfaz

# Carga los datos de perks desde un archivo JSON.
func load_perks():
	print("Cargando script")
	var file_path = "res://PerksJSON/PerksJSON.JSON"  # Ruta del archivo JSON

	# Intenta abrir el archivo para lectura.
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		print("Error al abrir el archivo: ", file_path)
		return

	var file_text = file.get_as_text()  # Lee el contenido del archivo como texto
	print("Contenido del archivo JSON: ", file_text)

	var json_instance = JSON.new()  # Crea una instancia del parser JSON
	var parse_result = json_instance.parse(file_text)  # Intenta analizar el JSON

	# Verifica si hubo un error al analizar el JSON
	if parse_result != OK:
		print("Error al analizar JSON: ", json_instance.get_error_message())
		file.close()

	# Valida y asigna los datos del JSON a perks_data
	perks_data = validate_perks_data(json_instance.get_data())

# Verifica si los datos JSON son válidos (deben ser un array no vacío).
func validate_perks_data(data):
	if typeof(data) == TYPE_ARRAY and data.size() > 0:
		return data  # Retorna los datos si son válidos
	return []  # Retorna un array vacío si los datos no son válidos

# Crea botones y etiquetas para cada perk basado en los datos cargados.
func create_perk_buttons():
	clear_perks()  # Limpia cualquier botón y etiqueta existente
	print("Creando botones de perks...")

	# Crear un contenedor de desplazamiento
	var scroll = ScrollContainer.new()
	scroll.custom_minimum_size = Vector2(300, 400)  # Define un tamaño mínimo para el área de desplazamiento
	add_child(scroll)  # Añade el contenedor de desplazamiento al nodo principal

	var vbox = VBoxContainer.new()  # Crea un contenedor vertical para organizar los elementos
	vbox.custom_minimum_size = Vector2(300, 400)  # Asegura que el VBox tenga un tamaño mínimo adecuado
	scroll.add_child(vbox)  # Añade el VBox al contenedor de desplazamiento

	# Itera sobre cada perk en los datos cargados
	for perk in perks_data:
		var hbox = HBoxContainer.new()  # Crea un contenedor horizontal para el botón y la etiqueta
		vbox.add_child(hbox)

		var button = Button.new()  # Crea un nuevo botón
		var label = Label.new()  # Crea una nueva etiqueta

		# Configura el botón con el costo del perk
		button.text = "Cost: $" + str(perk["cost"])
		button.custom_minimum_size = Vector2(150, 30)
		button.connect("pressed", Callable(self, "_on_perk_button_pressed").bind(perk["id"]))

		# Configura la etiqueta con el nombre y la descripción del perk
		label.text = perk["name"] + "\n" + perk["description"]
		label.custom_minimum_size = Vector2(200, 60)

		# Añade el botón y la etiqueta al contenedor horizontal
		hbox.add_child(button)
		hbox.add_child(label)
		
func _on_perk_button_pressed(perk_id):
	# Busca y muestra la información del perk cuyo ID coincide con el del botón presionado
	for perk in perks_data:
		if perk["id"] == perk_id:
			print("ID: ", perk["id"])
			print("Nombre: ", perk["name"])
			print("Descripción: ", perk["description"])
			print("Costo: $", perk["cost"])
			print("Tipo: ", perk["type"])
			break

# Elimina todos los botones y etiquetas del Control.
func clear_perks():
	# Itera sobre todos los hijos del nodo actual y elimina los contenedores VBox
	for child in get_children():
		if child is VBoxContainer:
			remove_child(child)
			child.queue_free()  # Libera la memoria del contenedor eliminado
			


var perks_positivas = [] #variable tipo array que almacena las perks positivas
var perks_negativas = [] #variable tipo array que almacena las perks negativas


func agregar_perk(perk):

	if perk.has("type"):
		if perk["type"] in ["CPS", "CPC"]:
			perks_positivas.append(perk)
		elif perk["type"] in ["MCPS", "MCPC", "PM"]:
			perks_negativas.append(perk)

func clasificar_perks():
	for perk in perks_data:
		agregar_perk(perk)

