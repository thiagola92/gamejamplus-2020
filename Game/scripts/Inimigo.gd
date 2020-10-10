extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direcao
var WALKING_SPEED = 150

func _physics_process(delta):
	var collision = move_and_collide(direcao * delta)
	if (collision):
		if (collision.CONNECT_PERSIST):
			$AnimatedSprite.stop()
	else:
		 $AnimatedSprite.play("run")
	

# Called when the node enters the scene tree for the first time.
func _ready():
	direcao = Vector2()
	direcao.x = WALKING_SPEED
	$AnimatedSprite.play("run")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
