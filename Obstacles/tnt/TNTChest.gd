extends "res://Obstacles/obstacle.gd"

var state = 'idle'



func recieve_damage():
	if state == 'idle':
		state = 'about_to_explode'
		$ExplosionTimer.start()
		$TimerView.show()
	


func _on_explosion_timer_timeout():
	$GPUParticles3D.emitting = true
	
	for object in $ExplodeArea.get_overlapping_areas():
		if object.has_node('DamageReciever'):
			var damage_reciever = body.get_node('DamageReciever')
			object.get_parent().recieve_damage()
	
	for object in $ExplodeArea.get_overlapping_bodies():
		if object.has_node('DamageReciever'):
			var damage_reciever = body.get_node('DamageReciever')
			object.get_parent().recieve_damage()
			
func _on_body_body_entered(body):
	recieve_damage()

func on_gpu_particles_3d_finished():
	queue_free()
