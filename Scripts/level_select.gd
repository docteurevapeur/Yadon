extends Node2D
@onready var city_label_one = $TextureButton/RichTextLabel
@onready var city_label_two = $TextureButton2/RichTextLabel
@onready var city_label_three = $TextureButton3/RichTextLabel
@onready var city_label_four = $TextureButton4/RichTextLabel
@onready var city_label_five = $TextureButton5/RichTextLabel


func _on_texture_button_pressed():
	Global.goto_scene("res://Scenes/level.tscn")


func _on_texture_button_2_pressed():
	Global.goto_scene("res://Scenes/level2.tscn")


func _on_texture_button_3_pressed():
	Global.goto_scene("res://Scenes/upgrade_scene.tscn")


func _on_texture_button_4_pressed():
	Global.goto_scene("res://Scenes/level3.tscn")


func _on_texture_button_5_pressed():
	get_tree().quit()


func _on_texture_button_mouse_entered():
	city_label_one.visible = true


func _on_texture_button_2_mouse_entered():
	city_label_two.visible = true


func _on_texture_button_mouse_exited():
	city_label_one.visible = false


func _on_texture_button_2_mouse_exited():
	city_label_two.visible = false


func _on_texture_button_3_mouse_entered():
	city_label_three.visible = true


func _on_texture_button_3_mouse_exited():
	city_label_three.visible = false


func _on_texture_button_4_mouse_entered():
	city_label_four.visible = true


func _on_texture_button_4_mouse_exited():
	city_label_four.visible = false


func _on_texture_button_5_mouse_entered():
	city_label_five.visible = true


func _on_texture_button_5_mouse_exited():
	city_label_five.visible = false
