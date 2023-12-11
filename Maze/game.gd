extends Node3D


func _ready():
	Global.level = 1
	var themusic = $music1
	themusic.play() 


func _on_timer_timeout():
	Global.update_time(-1)
	Global.update_score(-1)
