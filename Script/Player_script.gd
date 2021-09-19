extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 5
const left_border = 100
const right_border = 500

const top_border = 0
const bottom_border = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# check input user
	if(Input.is_action_pressed("ui_left")):
		if (position.x - speed > left_border):
			position.x -= speed
	elif(Input.is_action_pressed("ui_right")):
		if (position.x + speed < right_border):
			position.x += speed
	elif(Input.is_action_pressed("ui_up")):
		if (position.y + speed > top_border):
			position.y -= speed
	elif(Input.is_action_pressed("ui_down")):
		if (position.y+speed < bottom_border):
			position.y += speed	
	pass
