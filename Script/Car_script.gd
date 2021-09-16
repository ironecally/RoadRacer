extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 10 
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	modulate = Color(rng.randf_range(0,1),rng.randf_range(0,1),rng.randf_range(0,1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed
	
	
	
	pass
