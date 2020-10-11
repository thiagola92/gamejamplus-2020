extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var elapsed = 0.0

var daylight = false

func _process(delta):
	if daylight == true:
		$moon.hide()
		$sun.show()
		$bg_day.show()
		$bg_day_detail.show()
		$bg_day_detail2.show()
		$bg_night.hide()
		$bg_night2.hide()
	else:
		$moon.show()
		$sun.hide()
		$bg_day.hide()
		$bg_day_detail.hide()
		$bg_day_detail2.hide()
		$bg_night.show()
		$bg_night2.show()
		
	elapsed += delta
	self.text = str(int(elapsed))

	if elapsed >= 60.0:
		elapsed = 0.0
		if daylight == true:
			daylight = false
			get_parent().get_node("../Spawn_Enemy").stop()
		else:
			daylight = true
			get_parent().get_node("../Spawn_Enemy").start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
