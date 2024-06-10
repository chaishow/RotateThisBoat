extends Area3D

var velocity: Vector3
@export var speed = 40
@onready var particles = $GPUParticles3D

func _ready():
	velocity =  transform.basis * Vector3(0, 0, 1) * speed
	particles.emitting = true


func _process(delta):
	position += velocity*delta




func _on_visible_on_screen_enabler_3d_screen_exited():
	queue_free()



func _on_area_entered(area):
	if area.has_node('DamageReciever'):
		var damage_reciever = area.get_node('DamageReciever')
		if 'bullet' in damage_reciever.abusers:
			area.get_parent().recieve_damage()
			queue_free()
