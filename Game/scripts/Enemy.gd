extends Area2D

export var speed = 400
export var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * direction * delta

func _on_Enemy_area_entered(area):
	$AnimatedSprite.play("attack")
	speed = 0
	
	if area.get_name() == "Wall":
		area.hit()
	
