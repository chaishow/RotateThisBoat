extends Node3D

@export var rotation_speed = PI/2
var direction = 1

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		direction = -direction

func _physics_process(delta):
	rotate_y(rotation_speed*delta*direction)
	
