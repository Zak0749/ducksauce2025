extends TileMapLayer

@export var scene_to_spawn: PackedScene  # Assign the scene in the editor
@export var tile_size: Vector2 = Vector2(16, 16) # Size of each tile in pixels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if scene_to_spawn == null:
		print("Error: No scene assigned to 'scene_to_spawn'.")
		return
				
	for cell in self.get_used_cells():
		var world_position = self.map_to_local(cell)
		
		if self.get_cell_tile_data(cell).get_custom_data('top_lava'):
		 # Instance the scene
			print("lava_particles", cell)
			var new_scene_instance = scene_to_spawn.instantiate()

	# Set the position of the new scene
			new_scene_instance.position = world_position
		
			new_scene_instance.get_child(0).emitting = true
			print(new_scene_instance.position)
			
	# Add the new scene to the current scene (or a specific parent)
			add_child(new_scene_instance)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
