extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
#	Speed up animation in proportion to how fast sprite is moving
	if linear_velocity.x != 0:
		$AnimatedSprite.speed_scale = 1 + (abs(linear_velocity.x)/700)
	else:
		$AnimatedSprite.speed_scale = 1
	
#	If moving left, face left (sprite needs to be flipped)
	if linear_velocity.x < 0:
		$AnimatedSprite.flip_h = true
	
#	If moving right or not actively moving, face right (sprite isn't flipped as it faces right by default)
	if linear_velocity.x >= 0:
		$AnimatedSprite.flip_h = false

func jump():
	add_central_force(Vector2(0, -800))
	$AnimatedSprite.play("farting")
	print(to_global($Bum.position))

func end_jump():
	applied_force.y = 0
	$AnimatedSprite.play("standing")

func move_forward():
	add_central_force(Vector2(500, 0))

func end_move_forward():
	end_horizontal_movement()

func move_backward():
	add_central_force(Vector2(-500, 0))

func end_move_backward():
	end_horizontal_movement()

func end_horizontal_movement():
	applied_force.x = 0
	linear_velocity.x = 0

func _on_Player_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.shape_owner_get_owner(body_shape_index).name == "Floor":
		$AnimatedSprite.play("walking")

func get_bum_pos():
	return to_global($Bum.position)
