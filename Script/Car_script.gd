extends KinematicBody2D

var rng = RandomNumberGenerator.new()

export var speed = 220
export var oncoming_speed = 400

# direction of the car, in this case, the car only going south (Y-axis)
var direction = Vector2(0,1)


func _ready():
	# randomize car color so you're not bored
	rng.randomize()
	modulate = Color(rng.randf_range(0,1),rng.randf_range(0,1),rng.randf_range(0,1))
	pass

# physics ticks, different with _process which is non physics ticks
# sigh.. hard to explain :(
func _physics_process(delta):
	
	# transfer the direction to velocity by introducing speed to direction vector (x&y)
	var velocity = direction.normalized() * speed
	
	# function of kinematicBody2D, use this to move object instead of setting position
	# because physics engine is different with drawing engine
	move_and_collide(velocity * delta)
	
	# remove the car once its out of bound (to save memory :D)
	if(position.y >= 2000):
		print("removing car")
		queue_free()
	pass
