extends RigidBody2D

export var maxspeed = 300

signal lives
signal score
onready var t = $Timer
var _count = 0
var _size_decay = 0.02
var _alpha_decay = 0.03

onready var hitTile = get_node("/root/World/hitTile")
onready var hitWall = get_node("/root/World/hitWall")
onready var hitPaddle = get_node("/root/World/hitPaddle")
onready var Starting = get_node("/root/World/Starting")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	var WorldNode = get_node("/root/World")
	connect("score", WorldNode, "increase_score")
	connect("lives", WorldNode, "decrease_lives")
	
	var time = rand_range(0,2.5)
	t.set_wait_time(time)
	t.start()
	yield(t,"timeout")

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Tiles"):
			emit_signal("score",body.score)
			hitTile.playing = true
			body.queue_free()
		if body.get_name() == "Paddle":
			hitPaddle.playing = true
		if body.get_name() == "Wall":
			hitWall.playing = true
			
	if position.y > get_viewport_rect().end.y && get_name() == "Ball":
		emit_signal("lives")
		queue_free()
		print("Died")