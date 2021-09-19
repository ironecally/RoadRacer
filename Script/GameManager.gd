extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var car = preload("res://Scenes/obj_Car.tscn")
var rng = RandomNumberGenerator.new()
var score = 0
var spawner = []
# Called when the node enters the scene tree for the first time.
func _ready():
	spawner.append($Spawner1)
	spawner.append($Spawner2)
	spawner.append($Spawner3)
	spawner.append($Spawner4)
	
	# first car spawn, feel free to omit
	var car_spawned = car.instance()
	rng.randomize()
	var i = rng.randi_range(0,spawner.size()-1)
	spawner[i].add_child(car_spawned)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn_car():
	var car_spawned = car.instance()
	rng.randomize()
	var i = rng.randi_range(0,spawner.size()-1)
	
	if i <=1:
		car_spawned.get_node("Sprite").flip_h = true
		car_spawned.speed = 17
	
	spawner[i].add_child(car_spawned)
	pass

func _on_Spawn_Cooldown():
	spawn_car()
	pass # Replace with function body.
