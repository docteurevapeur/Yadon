extends Node2D
@onready var missile = preload("res://Scenes/missile.tscn")
var missile_count = Global.missile_number
var missile_time = Global.missile_reload_wait

func _process(delta):
	if missile_count > 0:
		if Input.is_action_just_pressed("fire"):
			var missile_temp = missile.instantiate()
			self.add_child(missile_temp)
			missile_count -= 1
	elif missile_time <= 0:
		missile_count = Global.missile_number
		missile_time = Global.missile_reload_wait
	else:
		missile_time -= delta
