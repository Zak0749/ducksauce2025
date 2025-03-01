extends Button

func start_game():
	get_tree().change_scene_to_file("res://Menus/Rift-Explain.tscn")

func _ready():
	self.connect("pressed", start_game)
