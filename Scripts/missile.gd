extends Node2D
@onready var missile_sprite = $Missile
@onready var missile_warning_sprite = $MissileWarning
@onready var engine_sound = $AudioStreamPlayer2D
@onready var hit = $AudioStreamPlayer2D2
var orig_mouse_position = Vector2.ZERO
var norm_orig_mouse_position = Vector2.ZERO
var angle = Vector2.ZERO
var blink_timer = .4
var speed = Global.missile_speed
var explosion = preload("res://Scenes/explosion.tscn")
var HP = Global.missile_HP

func _ready():
	orig_mouse_position = get_viewport().get_mouse_position()
	norm_orig_mouse_position = orig_mouse_position.normalized()
	angle = acos(norm_orig_mouse_position.dot(Vector2.RIGHT))
	self.rotation = angle
	add_to_group("missiles")
	engine_sound.play()


func _blink_warning(delta):
	if blink_timer <= 0:
		if missile_warning_sprite.visible == true:
			missile_warning_sprite.visible = false
		else:
			missile_warning_sprite.visible = true
		blink_timer = .4
	else:
		blink_timer = blink_timer - delta


func _movement(delta):
	global_position += Vector2.RIGHT.rotated(angle) * delta * speed


func explode():
	var explosion_instance = explosion.instantiate()
	get_parent().add_child(explosion_instance)
	explosion_instance.global_position = global_position
	self.queue_free()


func _process(delta):
	_blink_warning(delta)
	_movement(delta)
	if HP <= 0:
		explode()


func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("bullets"):
		HP -= 1
		hit.play()
	else:
		explode()


func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
