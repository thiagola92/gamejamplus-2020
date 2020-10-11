extends KinematicBody2D

export var speed = 400

var can_attack = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackCollision/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_A):
		$AnimatedSprite.play("walking_left")
		position.x -= speed * delta
	elif Input.is_key_pressed(KEY_D):
		$AnimatedSprite.play("walking_right")
		position.x += speed * delta
	else:
		$AnimatedSprite.stop()

func _unhandled_key_input(event):
	if event.pressed and event.scancode == KEY_E and can_attack:
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/Timer.start()
		can_attack = false

func _on_Timer_timeout():
	$AttackCollision/CollisionShape2D.disabled = true
	$AttackCollision/Timer.stop()
	can_attack = true
