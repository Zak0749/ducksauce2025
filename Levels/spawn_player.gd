extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the position of the new scene
	print($"/root/CheckpointCounter".get_player_pos())
	$Player.position = $"/root/CheckpointCounter".get_player_pos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
