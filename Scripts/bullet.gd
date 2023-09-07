extends Node2D

var angle = 200
var velocity = Vector2.UP
var speed = 400 
var assigned = false
var rng = RandomNumberGenerator.new()
var explosion = preload("res://Scenes/explosion_small.tscn")


func _process(delta):
	if angle != 200 and assigned == false:
		velocity = velocity.rotated(angle - rng.randf_range(-.2, .2)) * speed
		assigned = true
	if angle != 200:
		global_position += velocity * delta


func _on_area_2d_area_entered(area):
	var explosion_instance = explosion.instantiate()
	get_parent().add_child(explosion_instance)
	explosion_instance.global_position = global_position
	self.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
