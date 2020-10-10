extends KinematicBody2D

export var speed = 300

var default = "default"
var hammer = "hammer"

func _ready():
	
	pass # Replace with function body.

onready var obj = get_parent().get_node("Player")

func _physics_process(delta):
	var vector =  obj.global_position - global_position
	if vector.x < 150 and vector.x > -150:
		vector.x = 0
	elif vector.x > 0:
		vector.x -= 150
	elif vector.x < 0:
		vector.x += 150
	vector.y = 0
	var dir = (vector).normalized()
	move_and_slide(dir * speed)

func get_buff(buffs):
	if buffs == "pice":
		$AnimatedSprite.play(hammer)
	else:
		$AnimatedSprite.play(default)
		
	var timer = get_parent().get_node("Buff_Time")
	timer.start()

func lost_buff():
	$AnimatedSprite.play(default)

func _on_Buff_Time_timeout():
	lost_buff()
