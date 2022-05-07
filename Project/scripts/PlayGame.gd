extends Node2D

var farting = false
var fartScene = preload("res://scenes/Fart.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func fart():
	var fartNode = fartScene.instance()
	fartNode.position = $Player.get_bum_pos()
	add_child(fartNode)
	$FartTimer.start()
	var totalFartsAvailable = $FartSounds.get_children().size()
	randomize()
	var chosenFart = str((randi() % totalFartsAvailable) + 1)
	print("playing fart "+chosenFart)
	get_node("FartSounds/Fart"+chosenFart).play()

func _on_FartTimer_timeout():
	if farting:
		fart()

# Handle keyboard input for testing on a computer
# Could also use this to handle joystick/gamepad input
func _unhandled_input(event):
	if event.is_action_pressed("jump"):
		$Player.jump()
		farting = true
		fart()
	elif event.is_action_released("jump"):
		$Player.end_jump()
		farting = false
		$FartTimer.stop()
	elif event.is_action_pressed("move_right"):
		$Player.move_forward()
	elif event.is_action_released("move_right"):
		$Player.end_move_forward()
	elif event.is_action_pressed("move_left"):
		$Player.move_backward()
	elif event.is_action_released("move_left"):
		$Player.end_move_backward()

# Handle touch/click input from onscreen buttons
func _on_Jump_button_down():
	$Player.jump()
	farting = true
	fart()

func _on_Jump_button_up():
	$Player.end_jump()
	farting = false
	$FartTimer.stop()

func _on_MoveForwards_button_down():
	$Player.move_forward()

func _on_MoveForwards_button_up():
	$Player.end_move_forward()

func _on_MoveBackwards_button_down():
	$Player.move_backward()

func _on_MoveBackwards_button_up():
	$Player.end_move_backward()
