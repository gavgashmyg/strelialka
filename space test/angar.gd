extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.hp = 3
	if Global.capital <  $Node/Label2/Button2/lazer.COST:
		$Node/Label2/Button2.disabled
	else:
		$Node/Label2/Button2.disabled
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_esc_pressed() -> void:
	
	get_tree().change_scene_to_file("res://menu.tscn")
