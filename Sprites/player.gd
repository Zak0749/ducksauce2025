extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -2000.0
const MAX_GLIDE = 100.0;



var glide_energy = 100;	
var lastDirdirection = 1;

func _physics_process(delta: float) -> void:
	var isGliding = Input.is_action_pressed("glide") && glide_energy > 0	&& !is_on_floor()
	
	var modifier = 1.25 if isGliding else 1.0
	
#	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED * modifier
	elif isGliding:
		velocity.x = lastDirdirection * SPEED * modifier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * modifier)
	
#	gravity
	if is_on_floor():
		if glide_energy < MAX_GLIDE:
			glide_energy += 5
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY

#	gliding animations
	if isGliding:
		$Sprite.modulate = Color(0,0,1,1);
		velocity.y = get_gravity().y * 2 * delta
		glide_energy -= 1
	else:
		$Sprite.modulate = Color(1,1,1,1);
		velocity += get_gravity() * delta
		
	if glide_energy > 99:
		$GlideBar.visible = false
	else:
		$GlideBar.value = glide_energy
		$GlideBar.visible = true
		
		if glide_energy > 40:
			$GlideBar.modulate = Color(0.255, 0.82, 0.396)
		elif glide_energy > 20:
			$GlideBar.modulate = Color(0.949, 0.902, 0.141)
		else:
			$GlideBar.modulate = Color(0.961, 0.137, 0.137)
			
			
		

	move_and_slide()
	
	var collision = get_last_slide_collision();
	
	if collision:
		if collision.get_collider().name == 'LavaLayer':
			game_over()
		
	#if collision:
		#if collision.get_collider() is TileMap:
			## Get the TileMap node
			#var tilemap = collision.get_class()
			#
			#print(tilemap)
#
			## Check if the tile ID is the "dangerous" tile
			#if tile_id == 1: # Replace 1 with the actual tile ID of your dangerous tile
				#game_over()

func game_over():
	get_tree().change_scene_to_file("res://Menus/GameOver.tscn");
