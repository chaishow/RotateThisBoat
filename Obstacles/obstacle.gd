extends Node3D

@export var radial_velocity = -PI/3

var linear_velocity
var direction
var vortex
@onready var body = $Body

func _ready():
	vortex = get_tree().get_root().get_node("Game").get_node("World").get_node("Vortex")
	linear_velocity = randf_range(0.1, 0.4)


func _physics_process(delta):
	rotate_y(radial_velocity*delta)
	var direction = (vortex.global_position - global_position).normalized()
	global_position += linear_velocity*delta*direction
	
	if abs(global_position - vortex.global_position).length() < 0.05:
		if radial_velocity > -6*PI:
			radial_velocity = -6 * PI
		if scale.x > 0.1:
			scale -= Vector3(0.6, 0.6, 0.6)*delta
		else:
			queue_free()
		
func recieve_damage():
	$GPUParticles3D.emitting = true

func _on_body_body_entered(body):
	if body.has_node('DamageReciever'):
		var damage_reciever = body.get_node('DamageReciever')
		if 'obstacle' in damage_reciever.abusers:
			body.get_parent().recieve_damage()
			recieve_damage()




func _on_gpu_particles_3d_finished():
	queue_free()
