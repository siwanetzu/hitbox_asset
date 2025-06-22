extends ColorRect

# This is a simple dummy target for the hitbox demo.

func _ready():
	# Add this node to the "enemies" group so the hitbox can detect it.
	add_to_group("enemies")

func take_damage(amount):
	print("Dummy target took ", amount, " damage!")
	
	# Visual feedback: flash red when hit
	var original_color = color
	color = Color.RED
	await get_tree().create_timer(0.1).timeout
	color = original_color