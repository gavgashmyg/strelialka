extends Node2D
const INV = "res://data/invent.json"
const EQ = "res://data/invent.json"
var data = null
var data_f_s = null
var data_eq = null
var data_eq_fs = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = load_game(INV)
	data_f_s = data
	data_eq = load_game(EQ)
	data_eq_fs =  data_eq
	
	Global.hp = 3
	
	#if Global.capital <  $Node/Label2/Button2/lazer.COST:
		#$Node/Label2/Button2.disabled
	#else:
		#$Node/Label2/Button2.disabled
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$valy.text = "capital: "+str(Global.capital)
	if data:
		if data["golub"] == 1 and $Node2D/core/golub/Button:
			$Node2D/core/golub/Button.queue_free()
		if data["lazer"] == 1 and $Node2D/wopen/lazer/Button:
			$Node2D/wopen/lazer/Button.queue_free()
		
	if data_eq:
		$Node2D/wopen/gun.toggle_mode = data_eq["gun"]
		
	#if Global.capital

func _on_esc_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

func load_game(ff):
	var file = FileAccess.open(ff,FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		var json = JSON.new()
		var result = json.parse(json_string)
		file.close()
		
		if result == OK:
			var data = json.get_data()
			return data
			
func save_game(data,type):
	var file = FileAccess.open(type,FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(data)
		file.store_string(json_string)
		file.close()
		print("game saved")
	else:
		print("game save failed")

func _on_button_pressed() -> void:
	#print(Button.)
	var cost = 6#int(Button.text)
	if data:
		if data["golub"] != 1   and Global.capital>=cost:
			Global.capital-=cost
			data_f_s["golub"]=1
			save_game(data_f_s,INV)
			


func _on_button_lazer_pressed() -> void:
	var cost = 50#int(Button.text)
	if data:
		if data["lazer"] != 1   and Global.capital>=cost:
			Global.capital-=cost
			data_f_s["lazer"]=1
			save_game(data_f_s,INV)

func equ(name):
	if data[name]==1:
		if data_eq:
			if data_eq["gun"] != 1 :
				data_eq_fs["gun"]=1
				save_game(data_eq_fs,EQ)


func _on_gun_toggled(toggled_on: bool) -> void:
	if toggled_on:
		equ("gun")
