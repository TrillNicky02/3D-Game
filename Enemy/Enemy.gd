extends Area3D




func _on_Enemy_body_entered(body):
	if body.name == "Player":
		queue_free()

func die():
	var thesound = $sound_death
	thesound.play()
	
	queue_free()
	
