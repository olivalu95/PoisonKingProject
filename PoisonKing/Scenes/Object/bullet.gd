# TODO: Might either change node type to Area2D or extend from the CharacterBody2D instead 
extends Actor

# TODO: Might be changed depending on what required for the game
func start(pos, rot) -> void:
	position = pos
	rotation = rot
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision and collision.get_collider().has_method("hit"):
		collision.get_collider().hit()
