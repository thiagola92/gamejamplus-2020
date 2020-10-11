extends KinematicBody2D

signal toggle_off_attack
signal toggle_on_attack

export var speed = 400

var can_attack = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackCollision/AnimatedSprite.hide()
	$AttackCollision/AnimatedSprite.play()
	$AttackCollision/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("walking_left")
		$AttackCollision.position.x = -250
		velocity.x = speed * delta * -1
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("walking_right")
		$AttackCollision.position.x = 250
		velocity.x = speed * delta
	else:
		$AnimatedSprite.stop()
		
	move_and_collide(velocity)

func _unhandled_key_input(event):
	if event.pressed and event.scancode == KEY_E and can_attack:
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/AnimatedSprite.show()
		$AttackCollision/Timer.start()
		$AttackCollision/CD.start()
		$Audio.play(0)
		emit_signal("toggle_off_attack")
		can_attack = false

func _on_Timer_timeout():
	$AttackCollision/AnimatedSprite.hide()
	$AttackCollision/CollisionShape2D.disabled = true

func _on_CD_timeout():
	can_attack = true
	emit_signal("toggle_on_attack")
