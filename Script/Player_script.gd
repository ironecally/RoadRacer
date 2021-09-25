# this is using Area2D because its act as a trigger, 
# if need more physic movement, can consider using kinematic body instead
extends Area2D

# initial speed of the car
export var speed = 220

# border of the car movement
export var left_border = 305
export var right_border = 500
export var top_border = 0
export var bottom_border = 600

# signal to be fired if car is hitting something
signal hit

func _ready():
	pass
	


func _process(delta):
	# get the direction based on player input
	var direction = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	# transfer the direction to velocity by introducing speed to direction vector (x&y)
	var velocity = Vector2.ZERO
	if direction.length() > 0:
		velocity = direction.normalized() * speed

	# adjust position based on velocity over time
	position += velocity * delta
	
	# here's just a little extra
	# to make sure car didn't go out of bound on X and Y axis
	# clamp the position based on the map border
	position.x = clamp(position.x, left_border, right_border)
	position.y = clamp(position.y, top_border, bottom_border)
	
	#simple animation (rotate the car a little when left/right button is pressed)
	if(Input.is_action_pressed("ui_left")):
			$Sprite.rotation_degrees -=0.5
	if(Input.is_action_pressed("ui_right")):
			$Sprite.rotation_degrees +=0.5
	if(Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		#when key is released, reset the car rotation
		$Sprite.rotation_degrees = -90
	pass

# this function will be called when the player area entered by enemy's physic body
# for more info, check on the Node Tab of "Player" object
func _on_Player_body_entered(body):

	emit_signal("hit")
	pass # Replace with function body.
