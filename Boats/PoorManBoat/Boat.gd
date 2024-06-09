extends Node3D

@onready var animation_controller = $AnimationPlayer

#Передвижение
@export var rotation_speed = PI/3
var direction = 1

#Атака
var Bullet = preload("res://Boats/PoorManBoat/bullet.tscn")

var attack_on_cooldown = false
@onready var coolddown_timer = $AtackCooldownTimer


func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		direction = -direction
	if Input.is_action_just_pressed("ui_down"):
		shoot()

func _physics_process(delta):
	move(delta)


#Атака
func shoot():
	if not attack_on_cooldown:
		animation_controller.play("shoot")
		make_bullet()
		take_cooldown()

func make_bullet():
	var new_bullet = Bullet.instantiate()
	new_bullet.transform = $Marker3D.global_transform
	get_tree().get_root().get_node("Game").add_child(new_bullet)

func take_cooldown():
	coolddown_timer.start()
	attack_on_cooldown = true

func _on_atack_cooldown_timer_timeout():
	attack_on_cooldown = false


func _on_fire_button_up():
	shoot()

#Передвижение
func _on_change_direction_button_up():
	direction = - direction

func move(delta):
	rotate_y(rotation_speed*delta*direction)
