extends Node2D

const Brick = preload("res://Brick.tscn")

enum TYPE {
	WOOD = 2
}

func initialize(height, width, type, rotation = 0, sub_object = null):
	var right = Brick.instance()
	self.add_child(right)
	right.initialize(height / 5, height, type, rotation + 0.25, self)
	right.position = Vector2(
							(width / 2 - height / 10) * cos(rotation * TAU), 
							(width / 2 - height / 10) * sin(rotation * TAU))
	
	var bottom = Brick.instance()
	self.add_child(bottom)
	bottom.initialize(width / 5, width, type, rotation, self)
	bottom.position = Vector2(
							(height / -2 - width / 10) * sin(rotation * TAU),
							(height / 2 - width / 10) * cos(rotation * TAU))
							
	var diagonal = Brick.instance()
	self.add_child(diagonal)
	diagonal.initialize(width / 5, sqrt(pow(4 * width / 5, 2) + pow(4 * height / 5, 2)), type, rotation - 0.125, self)
	diagonal.position = Vector2(
								(-1 * width / 10 + width / 10 * sqrt(2) / 2) * cos(rotation * TAU) - (-1 * height / 10 + height / 10 * sqrt(2) / 2) * sin(rotation * TAU),
								(-1 * width / 10 + width / 10 * sqrt(2) / 2) * sin(rotation * TAU) + (-1 * height / 10 + height / 10 * sqrt(2) / 2) * cos(rotation * TAU))
	
	$RigidBody2D/CollisionShape2D.shape.points
	
