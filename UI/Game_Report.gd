extends Control


func _ready():
	update_score()
	update_time()
	update_lives()
	
	var themusic =$music3
	themusic.play()
	
		
	
func update_score():
	$Score.text = "Final Score:  " +str(Global.score)
	
func update_time():
	$Time.text = "Time Left:     " + str(Global.time)
	
func update_lives():
	$Lives.text = "Zombies Left:     " + str(Global.lives)

func _on_Play_pressed():
	Global.reset()
	get_tree().change_scene_to_file("res://Maze/game.tscn")

func _on_Quit_pressed():
	get_tree().change_scene_to_file("res://UI/Thanks_Menu.tscn")
	

