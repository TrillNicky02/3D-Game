

	
extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 5.5
const SCROLL_SPEED = 1.0
const MOUSE_SENSITIVITY = 0.001
const MOUSE_RANGE = 0.5
var health = 5
var menu = null




	
@onready var flash = $Pivot/Weapon/Uzi/Muzzle




# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		#$Pivot.rotation.x = clamp($Pivot.rotation.x, -MOUSE_RANGE, MOUSE_RANGE)
		
		
		
	
	if event.is_action_pressed("Menu"):	# instead of quitting, show the menu
		print("trap 1")
		print("level*10 ", Global.level*10)
		if Global.level == 1:
			menu = get_node_or_null("/root/Game/UI/Menu")
			print("trap x ", menu)
		if Global.level == 2:
			menu = get_node_or_null("" )
			print("trap y ", menu)
		
		print("trap 2  ", menu)
		if menu == null:
			get_tree().quit()
		else:
			print("trap 3")
			if not menu.visible:
				print("trap 3 1/2")
				menu.show()
				get_tree().paused = true 	# pause the game while the menu is visible
			else:
			#	save_input()
				print("trap 4 ")
				menu.hide()
				get_tree().paused = false
				
				
				
		
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Switch cameras
	if Input.is_action_just_pressed("Switch"):
		if $Overhead.current:
			$Pivot/Camera.current = true
		else:
			$Overhead.current = true
	
		
	
			
		

	var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	
	if Input.is_action_pressed("Shoot") and !flash.visible:
		flash.shoot()
		

