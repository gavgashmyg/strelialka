extends Node2D
const gg = preload("res://gg.tscn")
const an = preload("res://greg.tscn")
const kfc = preload("res://anam/Kfc.tscn")
const hill = preload("res://anam/hill.tscn")
var rng = RandomNumberGenerator.new()
var hard = 1
var over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.hp<=0 and not over:
		ggf()
		over = true
	if Global.num == 0:
		hard = 1
		
		$"for an/greg/Timer".wait_time =   hard
	else:
		hard =   1    / Global.num
		$"for an/greg/Timer".wait_time =   hard
		$"for an/kfc/Timer".wait_time =   hard*3
func spavn(obj):
	if not over:
		rng.randomize()
		
		var anemy = obj.instantiate()
		anemy.global_position = Vector2(rng.randi_range(40,210),-60)
		
		add_child(anemy)


func _on_timer_timeout():

	spavn(an) # Replace with function body.


func ggf():
	
	var anemy = gg.instantiate()
	anemy.global_position = Vector2(0,0)
	add_child(anemy)


func _on_timer_kfc_timeout() -> void:

	spavn(kfc)


func _on_hillti_timeout() -> void:
	spavn(hill)
