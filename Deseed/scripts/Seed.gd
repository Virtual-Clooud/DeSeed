extends RigidBody2D

var can_move = false
var can_sling = true
var jump = true
var shot_direction #Make the ball go in the oposite direction of the mouse
var point_0 #points of the line2D
var point_1

onready var block_area = $block_area
signal move(can_move)
signal game_over()
func move(): #Função ṕpra mover a bola
	if can_move:
		emit_signal("move", true)#Emitir sinal pra contagem de pontos
		set_bounce(0.5)
		set_gravity_scale(15) #Mudar gravidade
		if Input.is_action_just_pressed("ui_up") and jump: #Um pequeno pulo e um feedback pro jogador
			
			set_angular_velocity(get_angular_velocity() * 2)
			set_linear_velocity(Vector2(get_linear_velocity().x, -500))
			jump = false
func slingshot(): #No começo do jogo fazer a bola dar um slingshot
	shot_direction = get_local_mouse_position()
	set_gravity_scale(0)
	if can_sling and Input.is_action_pressed("sling"): #Line2D pra mostrar direção e sentido do tiro
		
		point_0 = $slingshot_line.set_point_position(0, Vector2(0, 0))
		point_1 = $slingshot_line.set_point_position(1, shot_direction)
	if can_sling and Input.is_action_just_released("sling"): #Atirar
		
		set_linear_velocity(-shot_direction)
		set_angular_velocity(-shot_direction.x/ 100)
		$slingshot_line.set_visible(false)
		can_move = true
		can_sling = false
func _physics_process(delta):
	slingshot()
	move()
	if get_linear_velocity().x <= 1.0 and can_move == true and can_sling == false:
		emit_signal("game_over")
