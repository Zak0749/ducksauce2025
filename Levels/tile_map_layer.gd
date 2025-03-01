extends TileMapLayer


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func getTileBelowPlayer(global_pos) -> TileData:	
	var localMapPos: Vector2 = self.to_local(global_pos)
	var tilePos: Vector2i = self.local_to_map( localMapPos )
	return self.get_cell_tile_data(tilePos)
