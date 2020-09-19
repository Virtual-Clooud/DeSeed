extends StaticBody2D
var ball = load("res://scenes/point_ball.tscn")

var randX #Valor aleatório de X
var randY #Mema coisa de Y
var ballI #Instância da bola
var count = 0 #Contador de bolas spawnadas
func spawn():
	
	if count < 3:
		randY = rand_range(-70, -500)#Pegar valor aleatório
		randX = rand_range(-70, 50)
		#Iniciar spawn da bola
		ballI = ball.instance()
		ballI.set_position(Vector2(randX, randY))#Definir posição da bola
		add_child(ballI)
func _physics_process(delta):
	
	spawn()
	count += 1


