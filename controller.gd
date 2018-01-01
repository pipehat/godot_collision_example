extends KinematicBody2D

const GRAVITY = 100
var last_collision_normal = null
var last_collision_point = null
const WIDTH = 1.0
const SPEED = 500
var dy = 0

func _ready():
	set_process(true)


func _process(delta):
	var vel = Vector2()
	
	dy += GRAVITY * delta
	vel.y = dy
	
	var dir = 0
	if Input.is_action_pressed("ui_left"):
		dir = -1
	elif Input.is_action_pressed("ui_right"):
		dir = 1
	vel.x = dir * SPEED * delta
	
	var motion = move(vel)
	var attempts = 10
	while (is_colliding() and attempts > 0):
		var collider = get_collider()
		print(collider.get_name())
		last_collision_point = get_collision_pos()
		last_collision_normal = get_collision_normal()
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		motion = move(motion)
		attempts -= 1
		
