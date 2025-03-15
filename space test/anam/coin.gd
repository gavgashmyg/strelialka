extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
const  WEGHT = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var live = 1

func _physics_process(delta):
	$AudioStreamPlayer.play()
	if live<=0:
		looted()
	move_and_collide(Vector2.UP * SPEED * delta * -1)
	if position.y >= 500:
		
		queue_free()
	

func gg():
	scale.y =3
	scale.x =3
	if Global.num< Global.record:
		$gl.global_position = Vector2(150,200)
		$gl.text = "gg"
	Global.num = 0
	get_tree().change_scene_to_file("res://menu.tscn")
	
	
func looted():
	queue_free()
	



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("shot"):
		body.bag+=1
		looted()
