# Inherits from the base Actor script
extends Actor

@onready var muzzle: Marker2D = get_node("Marker2D")

#TODO: Might be moved to base script if enemy support bullet
var Bullet = preload("res://Scenes/Object/bullet.tscn")

func _physics_process(delta):
	get_input()
	if Input.is_action_just_pressed("shoot"): shoot()
	move_and_slide()

func get_input() -> void:
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

# TODO: Might be moved to the base class to fit the Game
func hit() -> void:
	#Hit functionality goes here
	pass

func shoot() -> void:
	var bullet = Bullet.instantiate()
	# Rotation added incase bullet might need rotating
	bullet.start(muzzle.global_position, rotation)
	get_tree().root.add_child(bullet)
