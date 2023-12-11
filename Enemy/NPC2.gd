extends CharacterBody3D


var d = 0
var dialogue = [
	"You Must Be The Zombie Butler"
	,"I Am Here To Kill The Last Zombie and Save the Human Race"
	, "Today Is The Last Day On Earth For You And Your Zombie Brother"
	, "Prepare To Die!!!"
]

func _ready():
	$AnimationPlayer.play("Idle")


func _on_area_3d_body_entered(_body):
	$Area3D.queue_free()
	$Dialogue.show()
	$Dialogue/Control/Label.text = dialogue[d]
	d += 1
	$Dialogue/Timer.start()


func _on_timer_timeout():
	if d < dialogue.size():
		$Dialogue/Control/Label.text = dialogue[d]
		d += 1
	else:
		$Dialogue.queue_free()
		Global.unleash_zombie = true
		
		
func die():
	var dying = true
	$AnimationPlayer.play("Death")
	velocity = Vector3.ZERO
