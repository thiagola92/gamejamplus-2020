extends Area2D

export var speed = 400
export var direction = 1
export var health = 30

var can_attack = true
var targets = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("run")

func set_direction(dir):
	direction = dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * direction * delta
	$Health.text = str(health)
	
	if len(targets) <= 0:
		$AnimatedSprite.play("run")
		$HitSound.stop()
		speed = 400
		
	for target in targets:
		if can_attack && "Wall" in target.get_name():
			can_attack = false
			
			target.hit()
			$AttackTimer.start()
			
			break

func _on_Enemy_area_entered(area):
	if "Wall" in area.get_name():
		$AnimatedSprite.play("attack")
		$HitSound.play(0)
		speed = 0
		
		targets.append(area)
	elif "AttackCollision" in area.get_name():
		position.x += -100 * direction
		health -= 10
		
		if health <= 0:
			get_parent().remove_child(self)

func _on_Enemy_area_exited(area):
	targets.erase(area)

func _on_AttackTimer_timeout():
	can_attack = true

func hit():
	health -= 1
