extends Area2D

export var health = 100

func _ready():
	pass

func _process(delta):
	$Health.text = str(health)

func hit():
	health -= 1
