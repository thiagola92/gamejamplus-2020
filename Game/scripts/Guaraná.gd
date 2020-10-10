extends KinematicBody2D

export var speed = 300

var walking = "normal_walking"
var flip_walking = "flip_normal_walking"

func _ready():
	$AnimatedSprite.play(walking)
	pass # Replace with function body.

onready var obj = get_parent().get_node("Player")

func _physics_process(delta):
	var vector =  obj.global_position - global_position
	if vector.x < 150 and vector.x > -150:
		$AnimatedSprite.stop()
		vector.x = 0
		vector.y = 0
	elif vector.x > 0:
		$AnimatedSprite.play(flip_walking)
		vector.x -= 150
		vector.y = 0
	elif vector.x < 0:
		$AnimatedSprite.play(walking)
		vector.x += 150
		vector.y = 0
	var dir = (vector).normalized()
	move_and_slide(dir * speed)

func get_buff(buffs):
	if buffs == "pice":
		walking = "pice_walking"
		flip_walking = "flip_pice_walking"
	else:
		walking = "normal_walking"
		flip_walking = "flip_normal_walking"

func lost_buff():
	walking = "normal_walking"
	flip_walking = "flip_normal_walking"
