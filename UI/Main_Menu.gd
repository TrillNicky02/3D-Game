extends Control

func _ready():
	var themusic =$music2
	themusic.play()
	

func _on_Play_pressed():
	get_tree().change_scene_to_file("res://Maze/game.tscn")
	Global.update_level(1)

func _on_Quit_pressed():
	get_tree().quit()
