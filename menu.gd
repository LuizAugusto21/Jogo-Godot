extends Control

func _on_start_pressed():
	get_tree().change_scene("res://Node2D.tscn")


func _on_Quit_pressed():
	get_tree().quit()

