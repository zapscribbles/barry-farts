extends AnimatedSprite

export var max_scale: float = 0.5

signal current_animation_finished(anim_name)
var growing = true

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("animation_finished", self, "_on_animation_finished")
	connect("current_animation_finished", self, "_on_current_animation_finished")

func _process(delta):
	if growing:
		scale += Vector2(max_scale*delta, max_scale*delta)
	else:
		play("fart_dying")
	if scale >= Vector2(max_scale, max_scale):
		growing = false

func _on_Fart_animation_finished():
	emit_signal("current_animation_finished", animation)

func _on_current_animation_finished(anim_name: String):
#    print("Finished animation: ", anim_name)
	if anim_name == "fart_dying":
		queue_free()
