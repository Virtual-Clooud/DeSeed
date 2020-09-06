extends RigidBody2D
var can_move = false
var can_sling = true
var jump = true
var shot_direction #Make the ball go in the oposite direction of the mouse
var point_0 #points of the line2D
var point_1
onready var block_area = $block_area
func move(): #Function for moving the ball
	if can_move:
		
		set_bounce(0.5)
		set_gravity_scale(15) #Change the gravity for a good value
		if Input.is_action_just_pressed("ui_up") and jump: #Make sṕpin and make a little jump
			
			set_angular_velocity(get_angular_velocity() * 2)
			set_linear_velocity(Vector2(get_linear_velocity().x, -500))
			jump = false
func slingshot(): #At the start of the game make the ball slingshot
	shot_direction = get_local_mouse_position()
	set_gravity_scale(0)
	if can_sling and Input.is_action_pressed("sling"): #Line2D to show the power and direction of the shot
		
		point_0 = $slingshot_line.set_point_position(0, Vector2(0, 0))
		point_1 = $slingshot_line.set_point_position(1, shot_direction)
	if can_sling and Input.is_action_just_released("sling"): #Release of the shot
		
		set_linear_velocity(-shot_direction)
		set_angular_velocity(-shot_direction.x/ 100)
		$slingshot_line.set_visible(false)
		can_move = true
		can_sling = false
func _physics_process(delta):
	slingshot()
	move()
