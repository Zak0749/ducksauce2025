extends Button

@export var nextScene: PackedScene

func start_game():
	get_tree().change_scene_to_packed(nextScene)

func _ready():
	self.connect("pressed", start_game)
