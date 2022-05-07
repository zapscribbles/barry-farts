extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ButtonStartGame_pressed():
	$AnimationPlayer.play("fade_out")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene("res://scenes/PlayGame.tscn")
