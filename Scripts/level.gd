extends Node2D
@onready var missile = preload("res://Scenes/missile.tscn")
@onready var fighter = preload("res://Scenes/fighter.tscn")
var missile_count = Global.missile_number
var missile_time = Global.missile_reload_wait

func _ready():
	Global.fighter_available = true

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
	if Input.is_action_just_pressed("fighter"):
		if Global.fighter_available:
			var fighter_temp = fighter.instantiate()
			self.add_child(fighter_temp)
			Global.fighter_available = false
