extends Node


var lastCheckpoint = Vector2(0,0);

func get_player_pos() -> Vector2:
	return lastCheckpoint
	
func set_checkpoint(pos: Vector2):
	lastCheckpoint = pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
