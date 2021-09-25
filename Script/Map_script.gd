extends Node2D

export var speed = 10
var backgrounds = []

# Called when the node enters the scene tree for the first time.
func _ready():
	backgrounds.append($bg1)
	backgrounds.append($bg2)
	backgrounds.append($bg3)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed
	if position.y >= 1300:
		position.y = 300
	
	pass
