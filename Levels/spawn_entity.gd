extends TileMapLayer

@export var scene_to_spawn: PackedScene  # Assign the scene in the editor
@export var tile_size: Vector2 = Vector2(16, 16) # Size of each tile in pixels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if scene_to_spawn == null:
		print("Error: No scene assigned to 'scene_to_spawn'.")
		return
		
	self.visible = false
		
	for cell in self.get_used_cells():
		var world_position = self.map_to_local(cell)

		 # Instance the scene
		var new_scene_instance = scene_to_spawn.instantiate()

	# Set the position of the new scene
		new_scene_instance.position = world_position

	# Add the new scene to the current scene (or a specific parent)
		add_sibling.call_deferred(new_scene_instance)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
