extends AnimatableBody2D

var time_up = 3;
var time_down = 3;

var counter = time_down;

enum State {
	DOWN,
	UP
}

var current_state = State.DOWN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_up = randf_range(1, 2)
	time_down = randf_range(1, 2)
	
	pass # Replace with function body.

var should_scale = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	counter -= delta
	#print(counter, counter < 0, $Spout.scale.y)
	
	$Spout.scale.y = lerpf($Spout.scale.y, should_scale, 0.1)
	$LavaSpout.scale.y = $Spout.scale.y
	
	if counter < 0:
		match current_state:
			State.DOWN:
				current_state = State.UP
				counter = time_down
				should_scale = -20
					
				#$Spout.scale.y = 20.0
			State.UP:
				current_state = State.DOWN
				should_scale = 1
				counter = time_up
