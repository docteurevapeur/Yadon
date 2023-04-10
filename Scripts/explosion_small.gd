extends Node2D

@onready var animation = $AnimatedSprite2D
@export var stay_time = .5
var rng = RandomNumberGenerator.new()


func _ready():
	self.scale = Vector2(.05, .05)
	animation.play("default")


func _process(delta):
	if stay_time < 0:
		queue_free()
	else:
		stay_time -= delta
		self.scale += Vector2(.5 * delta + (rng.randf_range(-.1 * delta, .1 * delta)), .5 * delta + (rng.randf_range(-.1 * delta, .1 * delta)))
