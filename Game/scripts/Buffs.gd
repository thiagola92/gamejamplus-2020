extends KinematicBody2D

export var speed = 300

var default = "default"
var hammer = "hammer"

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
	
	if buff_active and Input.is_key_pressed(KEY_SPACE):
		var tree_resource = preload("../scenes/Wall.tscn")
		var tree = tree_resource.instance()
		tree.set_global_position(self.position)
#		tree.move_local_y(self.position.y - 20)
		get_parent().add_child(tree)
		lost_buff()

func get_buff(buffs):
	if buffs == "pice":
		$AnimatedSprite.play(hammer)
		buff_active = true
	else:
		$AnimatedSprite.play(default)
		buff_active = false
		
	var timer = get_parent().get_node("Buff_Time")
	timer.start()

func lost_buff():
	$AnimatedSprite.play(default)
	buff_active = false

func _on_Buff_Time_timeout():
	lost_buff()
