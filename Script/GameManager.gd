extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var car = preload("res://Scenes/obj_Car.tscn")
var rng = RandomNumberGenerator.new()
var score = 0
var score_multiplier = 1.0
var spawner = []
# Called when the node enters the scene tree for the first time.
func _ready():
	spawner.append($Spawner1)
	spawner.append($Spawner2)
	spawner.append($Spawner3)
	spawner.append($Spawner4)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score+=10*score_multiplier
	update_score_text(score)
	pass

func update_score_text(scr):
	var score_text = "%010d" % scr
	$Control/right_panel/Score_val.text = score_text
	pass

func spawn_car():
	var car_spawned = car.instance()
	rng.randomize()
	var i = rng.randi_range(0,spawner.size()-1)
	if i <=1:
		car_spawned.get_node("Sprite").flip_h = true
		car_spawned.speed = 270
	spawner[i].add_child(car_spawned)
	pass

func _on_Spawn_Cooldown():
	spawn_car()
	pass # Replace with function body.


func _on_Player_hit():
	print("player hit!")
	get_tree().paused = true
	pass # Replace with function body.
