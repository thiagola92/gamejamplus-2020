extends Area2D

export var max_health = 100
export var health = 0

func _ready():
	grow_tree()
	health = max_health

func _process(delta):
	$Health.text = str(health)

func hit():
	health -= 1
	
	if health == 0:
		kill_tree()
	elif health <= max_health * 0.25:
		$AnimatedSprite.play("low")
	elif health <= max_health * 0.5:
		$AnimatedSprite.play("half-low")
	elif health <= max_health * 0.75:
		$AnimatedSprite.play("half-high")

func grow_tree():
	$AnimatedSprite.play("growing")

func kill_tree():
	get_parent().remove_child(self)
