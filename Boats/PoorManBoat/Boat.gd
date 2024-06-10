extends Node3D

@onready var animation_controller = $AnimationPlayer
var vortex
#Передвижение
var rotation_speed 
var direction = 1

#Атака
var Bullet = preload("res://Boats/PoorManBoat/bullet.tscn")

var attack_on_cooldown = false
@onready var coolddown_timer = $AtackCooldownTimer

var max_hp = 5
var hp = max_hp

signal damage_recieved

func _ready():
	vortex = get_tree().get_root().get_node("Game").get_node("World").get_node("Vortex")
	rotation_speed = vortex.rotation_speed * 1.5

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		recieve_damage()
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
	new_bullet.transform = $BoatBody/Marker3D.global_transform
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
	


func recieve_damage():
	if hp > 0:
		hp -= 1
		damage_recieved.emit()
	
