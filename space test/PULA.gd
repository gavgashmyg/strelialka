extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var sh = 0



func _physics_process(delta):
	
	#if sh==0:
		#global_position =  $"..".global_position
	#sh = 1
	#velocity.y -= SPEED
	#sh  = $"..".global_position
	if position.y <= 0 :
		
		queue_free()
		
	move_and_collide(Vector2.UP * SPEED * delta)



func _on_area_2d_body_entered(body):
	if  body.has_method("destroy"):
		body.live -= 1
		queue_free()
