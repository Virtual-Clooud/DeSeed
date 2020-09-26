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
		if Input.is_action_pressed("ui_up"): #Um pequeno pulo e um feedback pro jogador
			if get_linear_velocity().x > 50: #Dar um limite de velocidade para o impulso do pulo
				set_linear_velocity(Vector2(get_linear_velocity().x - 5, get_linear_velocity().y + 10))
				#Uma funçãozinha pra diminui a velocidade horizontal
				apply_central_impulse(Vector2(-10, -35)) #impulso vertical
				apply_torque_impulse(-10.0)
func slingshot(): #No começo do jogo fazer a bola dar um slingshot
	shot_direction = get_local_mouse_position()
	set_gravity_scale(0)
	if can_sling and Input.is_action_pressed("sling"): #Line2D pra mostrar direção e sentido do tiro
		
		point_0 = $slingshot_line.set_point_position(0, Vector2(0, 0))
		point_1 = $slingshot_line.set_point_position(1, shot_direction)
	if can_sling and Input.is_action_just_released("sling"): #Atirar
		
		set_linear_velocity(-shot_direction * 5)
		set_angular_velocity(-shot_direction.x/ 50)
		$slingshot_line.set_visible(false)
		can_move = true
		can_sling = false
func _physics_process(delta):
	slingshot()
	move()
	if get_linear_velocity().x <= 5.0 and can_move == true and can_sling == false:
		emit_signal("game_over")
		set_visible(false)
	print(get_linear_velocity())



