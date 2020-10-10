extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direcao

func _physics_process(delta):
	move_and_slide(direcao * 150)

# Called when the node enters the scene tree for the first time.
func _ready():
	direcao = Vector2()
	direcao.x = 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
