extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 220

export var left_border = 305
export var right_border = 500
const top_border = 0
const bottom_border = 600

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#process movement with using physics
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, left_border, right_border)
	position.y = clamp(position.y, top_border, bottom_border)
	
	#simple animation (rotate the car a little when left/right button is pressed)
	if(Input.is_action_pressed("ui_left")):
			$Sprite.rotation_degrees -=0.5
	if(Input.is_action_pressed("ui_right")):
			$Sprite.rotation_degrees +=0.5
	if(Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		$Sprite.rotation_degrees = -90
	pass

func _on_Player_body_entered(body):
	print(body)
	emit_signal("hit")
	pass # Replace with function body.
