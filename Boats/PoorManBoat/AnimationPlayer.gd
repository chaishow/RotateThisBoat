extends AnimationPlayer



func _on_animation_finished(anim_name):
	if current_animation != 'roll':
		play("roll")
