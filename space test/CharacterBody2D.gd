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
var wopen = null
var core = null

func _ready() -> void:
	var dat = load_game()
	equ(load("res://eq/"+dat["wopen"]+".tscn"),"wopen")
	equ(load("res://eq/"+dat["core"]+".tscn"),"core")
	if core:
		$hot_t.wait_time = core.HOT_T
		hh = core.HH
func _physics_process(delta):
	
	Global.money = bag
	$Label.text = str(hot)
	if hot >= hh and not af:
		core.pl("hot")
		af = true
		$hot_t.start()
		
	if Input.is_action_just_pressed("ui_focus_next"): # and hot == 30 and hh == 1:
		lazer(true)
		
	if Input.is_action_just_released("ui_focus_next"):
		lazer(false)
		
		
		
		
	if Input.is_action_just_pressed("ui_accept"):
		shot(RS)
	if position.y > 500:
		death()
	
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
	if pp == KS and wopen:
		
		 
		for i in range(10):
			var rocket = pp.instantiate()
			rocket.global_position = global_position + Vector2(0,-40)
			add_child(rocket)
	elif pp == RS and wopen and not af:
		
		
		
		
		af = false
		wopen.shot()
		hot+=wopen.HOTING
		
		

func equ(bo,type):
	var rocket = bo.instantiate()
	if type == "wopen":
		wopen = rocket
	elif type == "core":
		core = rocket
	add_child(rocket)

#func _on_button_pressed():
	#velocity.x =  -1 * SPEED
#
#
#func _on_button1_pressed():
	#velocity.x =  SPEED
#

func _on_animated_sprite_2d_animation_finished() -> void:
	af = true


func _on_timer_timeout() -> void:
	if hot>0 and not af:
		hot-=1
		$Timer.start()
		
func  lazer(a):
	if a == true:
		$lazer.sh = 1
		
func death():
	Global.capital += bag
	scale.y =3
	scale.x =3
	Global.num = 0
	get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_sec_timeout() -> void:
	Global.time+=1


func _on_loot_body_entered(body: Node2D) -> void:
	if Global.hp<=1:
			Global.capital += bag
	#if body.has_method("looted"):
		#print(body)
		#bag+=body.WEGHT
		#body.looted()
		
func load_game():
	var file = FileAccess.open("res://data/eq.json",FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		var json = JSON.new()
		var result = json.parse(json_string)
		file.close()
		
		if result == OK:
			var data = json.get_data()
			
			return data


func _on_hot_t_timeout() -> void:
	hot = 0
	core.pl("default")
	af = false
