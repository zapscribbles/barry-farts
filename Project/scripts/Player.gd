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
	
#	If moving right, face right (sprite isn't flipped as it faces right by default)
	if linear_velocity.x > 0:
		$AnimatedSprite.flip_h = false

func start_jump():
	add_central_force(Vector2(0, -800))

func end_jump():
	applied_force.y = 0

func start_move_forward():
	add_central_force(Vector2(500, 0))

func end_move_forward():
	applied_force.x = 0
	linear_velocity.x = 0

func start_move_backward():
	add_central_force(Vector2(-500, 0))

func end_move_backward():
	applied_force.x = 0
	linear_velocity.x = 0
