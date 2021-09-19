extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 5

export var left_border = 305
export var right_border = 500
const top_border = 0
const bottom_border = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# check input user
	if(Input.is_action_pressed("ui_left")):
		if (position.x - speed > left_border):
			position.x -= speed
	if(Input.is_action_pressed("ui_right")):
		if (position.x + speed < right_border):
			position.x += speed
	if(Input.is_action_pressed("ui_up")):
		if (position.y + speed > top_border):
			position.y -= speed
	if(Input.is_action_pressed("ui_down")):
		if (position.y+speed < bottom_border):
			position.y += speed
			
	#simple animation
	if(Input.is_action_pressed("ui_left")):
		if (position.x - speed > left_border):
			$Sprite.rotation_degrees -=1.0
	if(Input.is_action_pressed("ui_right")):
		if (position.x + speed < right_border):
			$Sprite.rotation_degrees +=1.0
	if(Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		$Sprite.rotation_degrees = -90
	pass
