extends Area2D

export var health = 10

func _ready():
	grow_tree()
	pass

func _process(delta):
	$Health.text = str(health)

func hit():
	health -= 1
	get_node("HitSound").play(0)
	
	if health == 0:
		kill_tree()
	elif health <= 25:
		$AnimatedSprite.play("low")
	elif health <= 50:
		$AnimatedSprite.play("half-low")
	elif health <= 75:
		$AnimatedSprite.play("half-high")

func grow_tree():
	$AnimatedSprite.play("growing")

func kill_tree():
	get_parent().remove_child(self)
