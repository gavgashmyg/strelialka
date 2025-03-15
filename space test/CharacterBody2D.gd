extends CharacterBody2D

const RS = preload("res://pula.tscn")
const KS = preload("res://snarady/kartech.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hot = 0
var af = false
var hh = 0
var bag = 0

func _physics_process(delta):
	Global.money = bag
	$Label.text = str(hot)
	if hot >= 30:
		hh = 1
		anim.play("hot")
		if af ==  true:
			hot = 0
			hh = 0
	if Input.is_action_just_pressed("ui_focus_next"): # and hot == 30 and hh == 1:
		lazer(true)
		print(1)
	if Input.is_action_just_released("ui_focus_next"):
		lazer(false)
		print(4	)
		
		
		
	if Input.is_action_just_pressed("ui_accept") and hot < 30:
		shot(RS)
	if position.y > 500:
		queue_free()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction and position.x < 260 and position.x > 0:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	move_and_slide()
func  shot(pp):
	$Timer.start()
	if pp == KS:
		
		 
		for i in range(10):
			var rocket = pp.instantiate()
			rocket.global_position = global_position + Vector2(0,-40)
			add_child(rocket)
	elif pp == RS:
		$AudioStreamPlayer.play()
		var rocket = pp.instantiate()
		
		af = false
		rocket.global_position = global_position + Vector2(0,-20)
		hot+=1
		add_child(rocket)
		if Global.hp<=1:
			Global.capital += bag



func _on_button_pressed():
	velocity.x =  -1 * SPEED


func _on_button1_pressed():
	velocity.x =  SPEED


func _on_animated_sprite_2d_animation_finished() -> void:
	af = true


func _on_timer_timeout() -> void:
	if hot>0 and hh ==0:
		hot-=1
		$Timer.start()
		
func  lazer(a):
	if a == true:
		$lazer.sh = 1
		
func death():
	Global.capital += bag
	scale.y =3
	scale.x =3
	if Global.num< Global.record:
		$gl.global_position = Vector2(150,200)
		$gl.text = "gg"
	Global.num = 0
	get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_sec_timeout() -> void:
	Global.time+=1


func _on_loot_body_entered(body: Node2D) -> void:
	pass
	#if body.has_method("looted"):
		#print(body)
		#bag+=body.WEGHT
		#body.looted()
		
