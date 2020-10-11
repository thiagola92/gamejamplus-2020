extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spawn_Enemy_timeout():
	print("enemy")
	var enemy_resource = preload("../scenes/Enemy.tscn")
	var enemy = enemy_resource.instance()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_numer = rng.randf_range(1, 10.0)
	if int(random_numer) % 2:
		enemy.move_local_x(-2500)
	else:
		enemy.move_local_x(4200)
		enemy.set_direction(-1)
		enemy.get_node("AnimatedSprite").set_flip_h(true)
	enemy.move_local_y(426)
	get_parent().add_child(enemy)
