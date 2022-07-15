extends RigidBody2D

var hp

enum TYPE {
	WOOD = 2
}

func initialize(height, width, type, rotation = 0, sub_object = null):
	if sub_object != null:
		hp = null
		$CollisionShape2D.queue_free()
		gravity_scale = 0
	else:
		hp = type
			
		$CollisionShape2D.shape.extents.x = width / 2
		$CollisionShape2D.shape.extents.y = height / 2	
		
	$Sprite.scale.y = float(height) / $Sprite.texture.get_height()
	$Sprite.scale.x = float(width) / $Sprite.texture.get_width()

	
	self.rotation = rotation * TAU
