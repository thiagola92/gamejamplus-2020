extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var selected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2.hide()
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if selected == 0:
			get_tree().change_scene("res://scenes/Level 1.tscn")
		elif selected == 1:
			get_tree().change_scene("res://scenes/Credits.tscn")
	elif Input.is_key_pressed(KEY_W):
		if selected == 1:
			selected = 0
			$AnimatedSprite2.hide()
			$AnimatedSprite.show()
	elif Input.is_key_pressed(KEY_S):
		if selected == 0:
			selected = 1
			$AnimatedSprite.hide()
			$AnimatedSprite2.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
