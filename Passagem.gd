extends Area2D

func _on_Passagem_body_entered(body):
	get_tree().change_scene("Fase2.tscn")
