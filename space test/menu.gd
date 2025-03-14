extends Node2D

var t = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Record: "+ str(Global.record)
	if Input.is_action_pressed("ui_focus_next"):  
		Global.time = 0
		t+=1
		print(t)





func _on_button_pressed():
	Global.num = 0
	Global.hp = 3
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://angar.tscn")
