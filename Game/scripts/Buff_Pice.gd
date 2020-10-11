extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var obj = get_parent().get_node("Buff")
onready var timer = get_parent().get_node("Spawn_Buff")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Buff_Pice_body_entered(body):
	obj.get_buff("pice")
	timer.start()
	get_parent().remove_child(self)
