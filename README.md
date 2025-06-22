# Directional Hitbox for Godot 4

A simple, reusable, and configurable hitbox system for Godot 4, perfect for top-down action RPGs, brawlers, or any game that needs a straightforward way to handle 2D melee attacks.

## Features

-   **Directional Spawning:** Easily spawn a hitbox in front of, behind, or to the sides of your character.
-   **Configurable:** Adjust damage, lifetime, and the target group directly from the Godot Inspector.
-   **Self-Contained:** The hitbox handles its own logic and cleans itself up automatically.
-   **Physics-Based:** Uses Godot's `Area2D` for reliable collision detection.

## Installation

1.  Download this asset.
2.  Copy the `hitbox_asset` folder into your Godot project's `addons` directory. If you don't have an `addons` directory, create one at the root of your project.
3.  Go to **Project -> Project Settings -> Plugins** and enable the "Directional Hitbox" plugin.

## How to Use

1.  **Preload the Hitbox Scene:** In the script of your character that will be attacking (e.g., `player.gd`), preload the hitbox scene:
    ```gdscript
    const Hitbox = preload("res://addons/hitbox_asset/hitbox.tscn")
    ```

2.  **Instance the Hitbox:** In your attack function, create an instance of the hitbox and add it to your main scene tree.

    ```gdscript
    func _attack():
        var hitbox_instance = Hitbox.instantiate()
        
        # Configure it (optional, defaults can be set in the scene)
        hitbox_instance.damage = 5
        hitbox_instance.lifetime = 0.5
        hitbox_instance.target_group = "enemies"

        # Position it
        var offset = 30
        hitbox_instance.global_position = global_position + (Vector2.RIGHT * offset).rotated(rotation)
        
        # Add it to the scene
        get_tree().current_scene.add_child(hitbox_instance)
    ```

3.  **Set up the Target:**
    *   Ensure your enemy/target nodes are in the group specified by `target_group` (default is "enemies").
    *   Ensure your enemy/target script has a `take_damage(amount)` function.
        ```gdscript
        # In your enemy.gd script
        func take_damage(amount):
            health -= amount
            print("Ouch! Took ", amount, " damage.")
        ```

That's it! The hitbox will appear, detect bodies in the target group, call their `take_damage` function, and then remove itself.