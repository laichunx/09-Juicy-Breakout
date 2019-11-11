extends Node

export var score = 0
export var lives = 6

var new_ball = preload("res://Scenes/Ball.tscn")
onready var Music = get_node("/root/World/inGame")

func _ready():
	Music.play()

func increase_score(s):
	score += int(s)
	find_node("Score").update_score()
 
func decrease_lives():
	lives -= 1
	find_node("Lives").update_lives()
	if lives <= 0:
		get_tree().change_scene("res://Scenes/End.tscn")
		
func make_new_ball(pos):
	var ball = new_ball.instance()
	ball.position = pos
	ball.name = "Ball"
	var vector = Vector2(0, -300)
	#choose a random direction, constraining it so we don't get too steep an angle
	if randi()%2:
		vector = vector.rotated(rand_range(PI/6,PI/3))
	else: 
		vector = vector.rotated(rand_range(-PI/3,-PI/6))
	ball.linear_velocity = vector
	add_child(ball)