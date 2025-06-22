extends Area2D

# The damage this specific attack deals
@export var damage = 1

# The lifetime of the hitbox in seconds
@export var lifetime = 0.3

# The group name of the bodies that should be affected
@export var target_group = "enemies"


func _ready():
	# Hit any valid bodies already inside the area the moment it's created
	for body in get_overlapping_bodies():
		_on_body_entered(body)

	# Disappear after its lifetime expires
	await get_tree().create_timer(lifetime).timeout
	queue_free()


# Hit any valid bodies that walk into the hitbox while it's active
func _on_body_entered(body):
	if body.is_in_group(target_group):
		if body.has_method("take_damage"):
			body.take_damage(damage)