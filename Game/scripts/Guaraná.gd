extends KinematicBody2D

export var speed = 300

func _ready():
	$AnimatedSprite.play("normal_walking")
	pass # Replace with function body.

onready var obj = get_parent().get_node("Player")

func _physics_process(delta):
	var vector =  obj.global_position - global_position
	if vector.x < 150 and vector.x > -150:
		$AnimatedSprite.stop()
		vector.x = 0
		vector.y = 0
	elif vector.x > 0:
		$AnimatedSprite.play("flip_normal_walking")
		vector.x -= 150
		vector.y = 0
	elif vector.x < 0:
		$AnimatedSprite.play("normal_walking")
		vector.x += 150
		vector.y = 0
	var dir = (vector).normalized()
	move_and_slide(dir * speed)

