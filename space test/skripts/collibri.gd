extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const HOT_T = 3
const HH = 40
func _physics_process(delta: float) -> void:
	pass

func pl(t):
	$AnimatedSprite2D.play(t)
