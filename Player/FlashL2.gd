extends Node3D

var kill_attempt = 0.0
var kill_chance = 0.2

func shoot():
	show()  
	
	var thesound = $"../sound_uzi"
	
	thesound.play()
	
	
	$"../Timer".start()
	
	if $"../Aim".is_colliding():
		
		var target = $"../Aim".get_collider()
		if target.has_method("die"):
			
			kill_attempt = randf()
			if kill_chance >= kill_attempt:
				
				Global.score += 1000			
				target.die()
				Global.update_lives(-1)

		

func _on_Timer_timeout():
	hide()
	
	
