extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# check input user
	
	if(Input.is_action_pressed("ui_left")):
		print("left is pressed")
		position.x -= speed
	elif(Input.is_action_pressed("ui_right")):
		print("right is pressed")
		position.x += speed
	
	pass
