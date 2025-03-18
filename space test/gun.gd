extends CharacterBody2D

const RS = preload("res://pula.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const HOTING = 1

func _physics_process(delta: float) -> void:
	pass
func  shot(): 
	
	var rocket = RS.instantiate()
	rocket.global_position = global_position + Vector2(0,-20)
	add_child(rocket)
