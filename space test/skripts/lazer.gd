extends CharacterBody2D
const COST = 100
const HOTING = 10
var sh = 0
var sht = 0
#const FILE = preload("res://data/chtuki/lazer.json")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(3)

	move_and_collide(Vector2.UP * sh * 100)

func shot():
	if  sht==0:
		sht = 1
		$Timer.start()
		$Timer2.start()
		sh = 1

func _on_timer_timeout() -> void:
	if sht==1:
		sht = 2
		sh = -1
		$Timer.start()
	else:
		sht = 0
		sh = 0


func _on_lazer_body_entered(body: Node2D) -> void:
	if  body.has_method("destroy"):
		body.live -= 2
		


func _on_timer_2_timeout() -> void:
	print(43434)
	
	sh = 0
	sht = 0
	global_position = $"..".global_position
