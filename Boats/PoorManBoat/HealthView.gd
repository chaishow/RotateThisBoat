extends HBoxContainer

@onready var player = $".."
var Heart = preload("res://Materials/UITextures/heart.tscn")

func _ready():
	for i in range(player.max_hp):
		add_heart()
	
func delete_heart():
	get_child(get_child_count()-1).queue_free()

func add_heart():
	var new_heart = Heart.instantiate()
	add_child(new_heart)
	


func _on_boat_damage_recieved():
	delete_heart()


