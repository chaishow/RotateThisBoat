extends Node3D

@onready var animation_controller = $AnimationPlayer

@export var rotation_speed = PI/3
var direction = 1

var Bullet = preload("res://Boats/PoorManBoat/bullet.tscn")

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		direction = -direction
	if Input.is_action_just_pressed("ui_down"):
		shoot()

func _physics_process(delta):
	rotate_y(rotation_speed*delta*direction)

func shoot():
	animation_controller.play("shoot")
	var new_bullet = Bullet.instantiate()
	new_bullet.transform = $Marker3D.global_transform
	get_tree().get_root().get_node("Game").add_child(new_bullet)
	
