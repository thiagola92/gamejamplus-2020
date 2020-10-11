extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var elapsed = 0.0

var daylight = true

func _process(delta):
	if daylight == true:
		$moon.hide()
		$sun.show()
	else:
		$moon.show()
		$sun.hide()
		
	elapsed += delta
	self.text = str(int(elapsed))
	print(int(elapsed))
	if elapsed >= 10.0:
		elapsed = 0.0
		if daylight == true:
			daylight = false
		else:
			daylight = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
