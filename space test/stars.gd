extends Node2D

const an = preload("res://star.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,500,10):
		rng.randomize()

		var anemy = an.instantiate()
		anemy.global_position = Vector2(rng.randi_range(0,240),i)
		anemy.speed = rng.randi_range(25,30)
		add_child(anemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func  spavn():
	rng.randomize()

	var anemy = an.instantiate()
	anemy.global_position = Vector2(rng.randi_range(0,240),0)
	anemy.speed = rng.randi_range(25,30)
	add_child(anemy)

func _on_time_timeout():
	spavn()
