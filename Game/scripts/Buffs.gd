extends KinematicBody2D

export var speed = 300

var default = "default"
var sprout = "sprout"

var buff_active = false

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
	
	if buff_active and Input.is_action_just_pressed("ui_accept"):
		var tree_resource = preload("../scenes/Wall.tscn")
		var tree = tree_resource.instance()
		var position = get_node("../Player").position
		position.y -= 90
		tree.position = position
		get_parent().add_child(tree)
		lost_buff()

func get_buff(buffs):
	if buffs == "pice":
		$AnimatedSprite.play(sprout)
		$Audio.play(0)
		get_node("../Player/Control/Seed").disabled = false
		buff_active = true
	else:
		$AnimatedSprite.play(default)
		buff_active = false
		
	var timer = get_parent().get_node("Buff_Time")
	timer.start()

func lost_buff():
	$AnimatedSprite.play(default)
	get_node("../Player/Control/Seed").disabled = true
	buff_active = false

func _on_Buff_Time_timeout():
	lost_buff()
