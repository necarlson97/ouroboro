extends RigidBody2D

var speed = 2000

func _physics_process(delta):
	var move = Vector2.ZERO
	
	## WASD movement, normalized to speed
	if Input.is_action_pressed("ui_up"):
		move.y -= 1
	if Input.is_action_pressed("ui_down"):
		move.y += 1
	if Input.is_action_pressed("ui_left"):
		move.x -= 1
	if Input.is_action_pressed("ui_right"):
		move.x += 1

	if Input.is_action_pressed("ui_cancel"): # 'ui_cancel' is often mapped to the Escape key
		get_tree().quit()

	# Don't have diagonals be faster
	move = move.normalized() * speed

	#print("Move {s}".format({'s': move}))
	apply_central_impulse(move * delta)

	# Rotate to look at mouse
	# Assuming 'GetLookAngle()' is a function you've defined to get the angle towards the mouse cursor.
	# This is an example of how you might implement it in GDScript.
	var mouse_pos = get_global_mouse_position()
	var angle_to_mouse = (mouse_pos - global_position).angle()
	rotation = angle_to_mouse - PI/2
