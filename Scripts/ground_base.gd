extends Node2D
@onready var turret = $Turret
var angle = 0
var missile_position = Vector2.ZERO
var true_pos = Vector2.ZERO
var compare_line = Vector2.UP
var missile = []
var locked_missile
var bullet = preload("res://Scenes/Bullet.tscn")
var bullet_delay = 0
var bullet_burst = 25
var burst_delay = 0
@export var HP = 3
var explosion = preload("res://Scenes/explosion_big.tscn")
var broken = preload("res://Scenes/destroyed_base.tscn")
@onready var sound = $AudioStreamPlayer2D
var rng = RandomNumberGenerator.new()


func _ready():
	add_to_group("ground_stations")


func shoot(angle):
	var bullet_instance = bullet.instantiate()
	get_parent().add_child(bullet_instance)
	if missile_position.x > global_position.x:
		bullet_instance.position = global_position + (Vector2(0, -31).rotated(angle))
	else:
		bullet_instance.position = global_position + (Vector2(0, -31).rotated(-angle))
	bullet_instance.angle = turret.rotation
	sound.play()


func _process(delta):
	if HP > 0:
		missile = get_tree().get_nodes_in_group("missiles")
		if len(missile) > 0:
			locked_missile = missile[0]
			missile_position = locked_missile.global_position
			true_pos = missile_position - global_position
			angle = acos(compare_line.dot(true_pos.normalized()))
			if (missile_position.x > global_position.x):
				turret.rotation = angle
			else:
				turret.rotation = -angle
			
			if burst_delay <= 0:
				if bullet_burst > 0:
					if bullet_delay <= 0:
						shoot(angle)
						bullet_delay = .01
						bullet_burst -= 1
					else:
						bullet_delay -= delta * rng.randf_range(.7, 1.3)
				else:
					bullet_burst = 25
					burst_delay = 1.5 * rng.randf_range(.9, 1.1)
			else:
				burst_delay -= delta * rng.randf_range(.6, 1.4)
	if HP <= 0:
		queue_free()
		var explosion_instance = explosion.instantiate()
		get_parent().add_child(explosion_instance)
		explosion_instance.global_position = global_position
		var broken_instance = broken.instantiate()
		get_parent().add_child(broken_instance)
		broken_instance.global_position = global_position


func _on_area_2d_area_entered(area):
	HP -= Global.missile_damage
