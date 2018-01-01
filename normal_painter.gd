extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():

	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _draw():
	if (get_parent().last_collision_normal):
		print("drawing")
		draw_line(last_collision_point, last_collision_normal * 5, Color(1,0,0), 5)
	