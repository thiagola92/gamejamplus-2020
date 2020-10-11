extends KinematicBody2D

export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_A):
		$AnimatedSprite.play("walking_left")
		position.x -= speed * delta
	elif Input.is_key_pressed(KEY_D):
		$AnimatedSprite.play("walking_right")
		position.x += speed * delta
	else:
		$AnimatedSprite.stop()
