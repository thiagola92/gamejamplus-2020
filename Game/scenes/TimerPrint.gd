extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var elapsed = 0.0
func _process(delta):
	elapsed += delta
	self.text = str(int(elapsed))
	print(int(elapsed))
	
	if elapsed >= 30.0:
		
		elapsed = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
