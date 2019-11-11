extends StaticBody2D

var gray = preload("res://Assets/tile_gray.png")
var red = preload("res://Assets/tile_red.png")
var blue = preload("res://Assets/tile_blue.png")
var green = preload("res://Assets/tile_green.png")
var purple = preload("res://Assets/tile_purple.png")
var yellow = preload("res://Assets/tile_yellow.png")

onready var sprite = get_node("Sprite")
var score = 10
onready var _target = position
onready var t = $Timer

func _ready():
	if get_parent().name == "Gray Tiles":
		sprite.set_texture(gray)
	if get_parent().name == "Red Tiles":
		sprite.set_texture(red)
		score = 20
	if get_parent().name == "Blue Tiles":
		sprite.set_texture(blue)
		score = 30
	if get_parent().name == "Green Tiles":
		sprite.set_texture(green)
		score = 40
	if get_parent().name == "Purple Tiles":
		sprite.set_texture(purple)
		score = 50
	if get_parent().name == "Yellow Tiles":
		sprite.set_texture(yellow)
		score = 60
	position.y = -30
	var time = rand_range(0,2.5)
	t.set_wait_time(time)
	t.start()
	yield(t,"timeout")
	$Tween.interpolate_property(self,"position", position, _target, 2.0, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Tween.start()