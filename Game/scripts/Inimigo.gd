extends Area2D

export var speed = 400
export var direction = 1
export var health = 100

var can_attack = true
var targets = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * direction * delta
	$Health.text = str(health)
	
	for target in targets:
		if can_attack && target.get_name() == "Wall":
			can_attack = false
			
			target.hit()
			$AttackTimer.start()
			
			break

func _on_Enemy_area_entered(area):
	$AnimatedSprite.play("attack")
	speed = 0
	
	targets.append(area)

func _on_AttackTimer_timeout():
	can_attack = true

func hit():
	health -= 1
