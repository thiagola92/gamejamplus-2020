extends KinematicBody2D

export var speed = 400

var can_attack = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackCollision/AnimatedSprite.hide()
	$AttackCollision/AnimatedSprite.play()
	$AttackCollision/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_A):
		$AnimatedSprite.play("walking_left")
		$AttackCollision.position.x = -250
		position.x -= speed * delta
	elif Input.is_key_pressed(KEY_D):
		$AnimatedSprite.play("walking_right")
		$AttackCollision.position.x = 250
		position.x += speed * delta
	else:
		$AnimatedSprite.stop()

func _unhandled_key_input(event):
	if event.pressed and event.scancode == KEY_E and can_attack:
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/AnimatedSprite.show()
		$AttackCollision/Timer.start()
		can_attack = false

func _on_Timer_timeout():
	$AttackCollision/AnimatedSprite.hide()
	$AttackCollision/CollisionShape2D.disabled = true
	$AttackCollision/Timer.stop()
	can_attack = true
