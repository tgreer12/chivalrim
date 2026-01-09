extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# called once every physics frame
func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# movement is on the XY plane only
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	# enable movement on the y axis
	var ydir = 0
	if Input.is_physical_key_pressed(KEY_SPACE):
		ydir = 1
	elif Input.is_action_pressed("MouseRight"):
		ydir = -1
		
	velocity.y = ydir * SPEED

	move_and_slide()
	
# persistent rotation
var rot_x = 0
var rot_y = 0

# captures input events
func _input(event):
	# mouse moved and left mouse button is pressed
	if event is InputEventMouseMotion and event.button_mask & 1:
		# modify accumulated mouse rotation
		var LOOKAROUND_SPEED = 0.005
		rot_x += event.relative.x * LOOKAROUND_SPEED
		rot_y += event.relative.y * LOOKAROUND_SPEED
		transform.basis = Basis() # reset rotation
		rotate_object_local(Vector3(0, 1, 0), rot_x) # first rotate in Y
		rotate_object_local(Vector3(1, 0, 0), rot_y) # then rotate in X
