extends Node
var current_scene = null
var missile_number = 3
var missile_reload_wait = 4
var missile_speed = 250
var missile_HP = 3
var missile_damage = 1
var points = 0
var fighter_HP = 3
var fighter_available = true

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
