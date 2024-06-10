extends TextureProgressBar


@onready var timer = $"../../../../Boat".get_node("AtackCooldownTimer")


func _process(delta):
	value = timer.time_left


