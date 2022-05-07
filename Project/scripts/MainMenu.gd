extends Control

var fartScene = preload("res://scenes/Fart.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ButtonStartGame_pressed():
	$AnimationPlayer.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene("res://scenes/PlayGame.tscn")

func fart(pos):
	var fartNode = fartScene.instance()
	fartNode.position = pos
	add_child(fartNode)
	var totalFartsAvailable = $FartSounds.get_children().size()
	randomize()
	var chosenFart = str((randi() % totalFartsAvailable) + 1)
	print("playing fart "+chosenFart)
	get_node("FartSounds/Fart"+chosenFart).play()

func _input(event: InputEvent):
	if event is InputEventMouseButton && event.is_pressed():
		fart(event.position)
