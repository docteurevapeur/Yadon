extends Node2D
@onready var label_three = $Upgrades/TextureButton3/RichTextLabel
@onready var label_two = $Upgrades/TextureButton2/RichTextLabel
@onready var label_one = $Upgrades/TextureButton/RichTextLabel
@onready var back_text = $BackButton/RichTextLabel

#This code gets repetitive, so here are some comments for myself

#Hoverchecks

func _on_texture_button_3_mouse_entered():
	label_three.visible = true


func _on_texture_button_3_mouse_exited():
	label_three.visible = false


func _on_texture_button_mouse_entered():
	label_one.visible = true


func _on_texture_button_mouse_exited():
	label_one.visible = false


func _on_texture_button_2_mouse_entered():
	label_two.visible = true


func _on_texture_button_2_mouse_exited():
	label_two.visible = false


func _on_back_button_mouse_entered():
	back_text.visible = true


func _on_back_button_mouse_exited():
	back_text.visible = false

#Back button

func _on_back_button_pressed():
	Global.goto_scene("res://Scenes/level_select.tscn")

#Actual Upgrade function

func _on_texture_button_3_pressed():
	if Global.points > 0:
		Global.missile_damage += 1
		Global.missile_speed -= 20
		Global.points -= 1


func _on_texture_button_pressed():
	if Global.points > 0:
		Global.missile_HP += 2
		Global.missile_speed -= 30
		Global.points -= 1


func _on_texture_button_2_pressed():
	if Global.points > 0:
		Global.missile_speed += 50
		Global.points -= 1
