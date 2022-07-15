extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bird = preload("res://Bird.tscn")
var current_bird: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_bird()

func spawn_bird():
	current_bird = bird.instance()
	add_child(current_bird)

func _process(delta):
	if get_tree().get_root().has_node(current_bird.get_path()):
		$Camera2D.global_position = current_bird.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
