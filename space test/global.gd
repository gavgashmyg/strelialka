extends Node

const FILE = preload("res://data/records.json")
var num =0
var record = 0
var stuff = {"rec":0,"money":0}
var hp = 3
var time = 0
var money = 0
var capital = 0
var bbag = 0
func _ready() -> void:
	var data = load_game()
	record = data["record"]
	capital = data["money"]
func _process(delta):
	stuff ={"rec":record,"money":capital}
	if record< num:
		record = num

func save_game(data):
	var file = FileAccess.open("res://data/records.json",FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(data)
		file.store_string(json_string)
		file.close()
		print("game saved")
	else:
		print("game save failed")
	
func load_game():
	var file = FileAccess.open("res://data/records.json",FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		var json = JSON.new()
		var result = json.parse(json_string)
		file.close()
		
		if result == OK:
			var data = json.get_data()
			return data
	#"res://data/records.tres".record = record
#
#func save_game():
	#var fileSave = new
	#var saveFile = FileAccess.open("res://data/records.json", FileAccess.WRITE)
	#var saveNodes = get_tree().get_nodes_in_group("Persist")
	#for node in saveNodes:
		#if node.scene_file_path.is_empty():
			#print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			#continue
			#
			#if !node.has_method("save"):
				#print("persistent node '%s' is missing a save() function, skipped" % node.name)
				#continue
#
		## Call the node's save function.
			#var node_data = node.call("save")
#
		## JSON provides a static method to serialized JSON string.
			#var json_string = JSON.stringify(node_data)
#
		## Store the save dictionary as a new line in the save file.
			#saveFile.store_line(json_string)
	#
