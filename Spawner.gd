extends Node3D

@onready var spawn_point = $SpawnPoint
@onready var spawn_timer = $SpawnTimer
@onready var vortex = $".."

var obstcles = [preload("res://Obstacles/barrel.tscn"), preload("res://Obstacles/tnt/tnt_chest.tscn")]

func spawn_random_obstacle():
	var new_obstacle = obstcles[randi()%len(obstcles)].instantiate()
	new_obstacle.global_position = spawn_point.global_position
	vortex.add_child(new_obstacle)


func _on_spawn_timer_timeout():
	spawn_random_obstacle()
