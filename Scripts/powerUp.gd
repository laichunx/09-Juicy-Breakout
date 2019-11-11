extends RigidBody2D

export var maxspeed = 300
var new_ball = preload("res://Scenes/Ball.tscn")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Tiles"):
			body.find_node("spark").emitting = true
		if body.get_name() == "Paddle":
			pass
		if body.get_name() == "Ball":
			var newBall = new_ball.instance()
			newBall.position = position - Vector2(0, 32)
			newBall.name = "Ball"
			newBall.linear_velocity = Vector2(400, -400)
			get_parent().add_child(newBall)
				
	if position.y > get_viewport_rect().end.y:
		queue_free()