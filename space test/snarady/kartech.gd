extends CharacterBody2D


const SPEED = 1
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var sh = 0
var rng = RandomNumberGenerator.new()


func _physics_process(delta):
	if position.y <= 200 or position.x < -200 or position.x> 250:
		queue_free()
	move_and_collide(Vector2(sh,-50) * SPEED * delta)
	#move_and_collide(Vector2(80,-50) * SPEED * delta)


func _on_area_2d_body_entered(body):
	if  body.has_method("destroy"):
		body.live -= 1
		queue_free()


func _on_ready() -> void:
	rng.randomize()
	sh = rng.randi_range(-80,80)
