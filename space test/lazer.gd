extends Area2D

var sh = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_focus_next"): # and hot == 30 and hh == 1:
		sh = 1
	if Input.is_action_just_released("ui_focus_next"):
		sh = 0
	if sh == 0:
		$AnimatedSprite2D.hide()
	else:
		if $"..".hot<30 and $"..".hh == 0:
			$"..".hot+=1
		else:
			sh = 0
		$AnimatedSprite2D.show()



func _on_body_entered(body: Node2D) -> void:
	print(9)
	if  body.has_method("destroy") and sh != 0:
		body.live -= 1
		
