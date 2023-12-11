extends Control

func _on_Restart_pressed():				# if we restart, then unpause the game and the reload the scene
	get_tree().paused = false
	if Global.level == 1:
		get_tree().change_scene_to_file("res://Maze/game.tscn")
		
	if Global.level == 2:
		
		get_tree().change_scene_to_file("res://Level2.tscn")

func _on_Quit_pressed():
	
	get_tree().quit()

