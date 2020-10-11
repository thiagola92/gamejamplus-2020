extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spawn_Buff_timeout():
	
	var node = get_parent().get_node("Buff_Pice")
	if node: 
		print("buff avaiable")
	else:
		var buff_resource = preload("../scenes/Buff_Pice.tscn")
		var buff = buff_resource.instance()
		buff.set_scale(Vector2(0.3, 0.3))
		buff.move_local_x(900)
		buff.move_local_y(170)
		get_parent().add_child(buff)
