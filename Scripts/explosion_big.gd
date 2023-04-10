extends Node2D
@onready var animation = $AnimatedSprite2D
@onready var boom = $AudioStreamPlayer2D
@export var stay_time = .5
var rng = RandomNumberGenerator.new()


func _ready():
	animation.play("default")
	animation.rotate(1.2)
	boom.play()


func _process(delta):
	if stay_time < 0:
		queue_free()
	else:
		stay_time -= delta
		self.scale += Vector2(5 * delta + (rng.randf_range(-.2 * delta, .2 * delta)), 5 * delta + (rng.randf_range(-.2 * delta, .2 * delta)))
