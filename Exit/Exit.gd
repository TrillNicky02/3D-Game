extends Area3D

var locked = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Light.light_color = Color(1,0,0,1)
	



func unlock():
	locked = false
	$Light.light_color = Color(0,1,0,1)


func _on_Exit_body_entered(body):
	if body.name == "Player" and not locked:
		body.queue_free()
		Global.score += 1000
		Global.update_level(1)
		queue_free()
		get_tree().change_scene_to_file("res://Level2.tscn")
		
