extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var next = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and $AnimatedSprite.animation == "default":
		$AnimatedSprite.play("gb")
		$Audio.play(0)
		get_parent().get_node("Label").hide()
		get_parent().get_node("Label2").hide()
		next = true
	if $AnimatedSprite.animation == "gb":
		move_and_slide(Vector2(-207, 45))


func _on_AnimatedSprite_animation_finished():
	if next:
		$AnimatedSprite.set_frame(7)
		$AnimatedSprite.stop()
		get_tree().change_scene("res://scenes/Level 1.tscn")
		queue_free()
