extends Node2D
var acceleration = Vector2(180, 0)
var velocity = Vector2(200, 0)
var mouse_angle = 0
var burst_delay = 0
var bullet_amount = 0
var explosion = preload("res://Scenes/explosion.tscn")
var bullet = preload("res://Scenes/fighter_bullet.tscn")
@onready var engine_sound = $AudioStreamPlayer2D
@onready var bullet_sound = $AudioStreamPlayer2D2
var HP = Global.fighter_HP
var up = false


func _ready():
	velocity.rotated(get_angle_to(get_global_mouse_position()))
	self.rotate(get_angle_to(get_global_mouse_position()))
	engine_sound.play()
	add_to_group("missiles")


func _process(delta):
	mouse_angle = get_angle_to(get_global_mouse_position())
	_movement(delta, mouse_angle)
	if Input.is_action_pressed("left_click"):
		if burst_delay <= 0:
			shoot()
			burst_delay = .02
		elif burst_delay > 0:
			burst_delay -= delta


func _movement(delta, angle):
	if self.rotation_degrees >= -30:
		self.rotate(angle * delta)
		velocity += acceleration * delta
		global_position += velocity.rotated(self.rotation) * delta
	else:
		global_position += velocity.rotated(self.rotation) * delta


func shoot():
	var bullet_instance = bullet.instantiate()
	get_parent().add_child(bullet_instance)
	bullet_instance.position = global_position + Vector2(14, 0).rotated(self.rotation)
	bullet_instance.angle = self.rotation + PI/2
	bullet_sound.play()
	bullet_instance.add_to_group("fighter_bullets")


func _on_visible_on_screen_notifier_2d_screen_exited():
	Global.fighter_available = true
	queue_free()


func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("bullets") and HP > 0:
		HP -= 1
	elif area.get_parent().is_in_group("fighter_bullets"):
		pass
	else:
		Global.fighter_available = true
		explode()


func explode():
	var explosion_instance = explosion.instantiate()
	get_parent().add_child(explosion_instance)
	explosion_instance.global_position = global_position
	self.queue_free()
