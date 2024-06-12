extends Node3D



var children 
@export var rotation_speed = PI/12

func _ready():
	children = get_children()

func _physics_process(delta):
	rotate_y(rotation_speed*delta)


