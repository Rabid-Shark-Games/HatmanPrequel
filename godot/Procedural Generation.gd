extends Node2D

const Brick = preload("res://Triangle.tscn")

func _ready():
	var test = Brick.instance()
	add_child(test)
	test.initialize(100, 100, test.TYPE.WOOD)
