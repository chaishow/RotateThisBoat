extends Label3D



func _process(delta):
	if $"..".state == 'about_to_explode':
		text = str(snapped($"../ExplosionTimer".time_left, 1))
