extends Node

# preload the car class into variable (similar with import)
var car = preload("res://Scenes/obj_Car.tscn")
var rng = RandomNumberGenerator.new()


var score = 0
var score_multiplier = 1.0

# spawner variable will keep each of the spawner
# spawner[0] = lane 1
# spawner[1] = lane 2
# spawner[2] = lane 3
# spawner[3] = lane 4
var spawner = []

func _ready():
	# register all the spawner object to the system
	spawner.append($Spawner1)
	spawner.append($Spawner2)
	spawner.append($Spawner3)
	spawner.append($Spawner4)
	
	pass # Replace with function body.


func _process(delta):
	# restart button
	if(Input.is_action_just_pressed("ui_select")):
		get_tree().paused = false
		get_tree().reload_current_scene()
	
	# update the score in every ticks
	score+=10*score_multiplier
	update_score_text()
	
	# check if player is in normal / oncoming lane
	if($Player.position.x> 400):
		$Control/right_panel/AnimatedSprite.play("normal_lane")
		score_multiplier = 1.0
	elif($Player.position.x <= 400):
		$Control/right_panel/AnimatedSprite.play("oncoming_lane")
		score_multiplier = 2.0
	pass

# to update the score text
func update_score_text():
	var score_text = "%010d" % score
	$Control/right_panel/Score_val.text = score_text
	
	var score_multiplier_text = "%.2f x" % score_multiplier
	$Control/right_panel/Score_multiplier_val.text = score_multiplier_text
	
	pass

# spawn_car will spawn new car in the random spawner when called
func spawn_car():
	# equivalent with car.New() in java, just to create the object :D
	var car_spawned = car.instance()
	
	# randomize in which spawner position the car will appear
	rng.randomize()
	var i = rng.randi_range(0,spawner.size()-1)
	
	#check if spawner belongs to oncoming lane
	if i <=1:
		
		car_spawned.get_node("Sprite").flip_h = true
		car_spawned.speed = car_spawned.oncoming_speed
	
	#spawn the car object as the child of spawner (in spawner position)
	spawner[i].add_child(car_spawned)
	pass

# _on_Spawn_Cooldown function is triggered by Timer timeout signal
func _on_Spawn_Cooldown():
	# simply to spawn new car as the function name suggest
	spawn_car()
	pass

# _on_Player_hit is triggered by Player's hit signal
func _on_Player_hit():
	print("player hit!")
	$Control/right_panel/AnimatedSprite.play("crash")
	get_tree().paused = true
	pass
