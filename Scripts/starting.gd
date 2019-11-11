extends Label

export var countdown = 5
onready var Timer = $Timer
onready var Game = get_node("/root/World")
onready var Paddle = get_node("/root/World/Paddle")

func _ready():
	if countdown > 0:
		startCountdown(countdown)

func startCountdown(c):
	countdown = c
	if countdown > 0:
		Timer.set_wait_time(1)
		Timer.start()
		text = "" + str(countdown)


func _on_Timer_timeout():
	countdown -= 1
	if countdown > 0:
		text = "" + str(countdown)
	else:
		text = ""
		if not Game.has_node("Ball"):
			var pos = Paddle.position - Vector2(0, 32)
			Game.make_new_ball(pos)
		Timer.stop()