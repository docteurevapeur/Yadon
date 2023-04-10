extends Node2D
var time = 4


func _process(delta):
	var stations = get_tree().get_nodes_in_group("ground_stations")
	if len(stations) <= 0:
		if time <= 0:
			Global.goto_scene("res://Scenes/level_select.tscn")
			Global.points += 1
		else:
			time -= delta
