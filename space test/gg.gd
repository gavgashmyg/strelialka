extends Node2D

var data = {"record":Global.record}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.capital += Global.money+Global.num
	Global.save_game_u()
	$AudioStreamPlayer2D.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label2.text = str(Global.num)
	$Label4.text = str (Global.time)

func _on_button_pressed() -> void:
	Global.hp = 3
	get_tree().change_scene_to_file("res://menu.tscn")
