extends Node

var menu = null
var level = 0
var score = 1000
var unleash_zombie = false
var lives = 6
var time = 120

#const SAVE_PATH = "res://settings.cfg"
#var save_file = ConfigFile.new()
#var inputs = ["Left","Right","Forward","Back"]

func _ready():
	process_mode = PROCESS_MODE_ALWAYS		# global should never be paused
	reset()

#	load_input()

func _unhandled_input(event):
	if event.is_action_pressed("Menu"):	# instead of quitting, show the menu
		
		
		if level == 1:
			menu = get_node_or_null("/root/Game/UI/Menu")
			
		if level == 2:
			pass
			
		
		
		if menu == null:
			get_tree().quit()
		else:
			
			if not menu.visible:
				
				menu.show()
				get_tree().paused = true 	# pause the game while the menu is visible
			else:
			#	save_input()
				
				menu.hide()
				get_tree().paused = false
				
	if event.is_action_pressed("quit"):
		get_tree().quit()				
				
func reset():
	get_tree().paused = false
	score = 200	
	time = 150
	lives = 6
	score = 1000
	unleash_zombie = false
	

func update_score(s):
	score += s
	#print ("GlobalScore UPdate ", score )
	
func update_level(s):
	level += s
	#print ("Global Level  ", level )
	
func update_lives(s):
	lives += s
	#print ("Global LIVeS  ", lives )
	if lives < 1:
		get_tree().change_scene_to_file("res://UI/Game_Report.tscn")
	
func update_time(t):
	time += t
	update_score(t)
	#print ("GlobalTime UPdate ", time )
	if time < 1:
		get_tree().change_scene_to_file("res://UI/Game_Report.tscn")
	

