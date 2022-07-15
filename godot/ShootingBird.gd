extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var shot = false
var mstart = null
var shooting = false
var collided = false

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0
	connect("body_entered", self, "on_be")

func on_be(body):
	if not shot:
		return
	collided = true
	gravity_scale = 1
	var timer = Timer.new()
	timer.wait_time = 5
	timer.one_shot = true
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	queue_free()
	timer.queue_free()
	$"..".spawn_bird()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not shot:
		if Input.is_action_just_pressed("start"):
			shooting = true
			mstart = get_viewport().get_mouse_position()
		elif Input.is_action_just_pressed("rc"):
			shooting = false
			$Line2D.points[1] = Vector2(0,0)
		elif shooting and Input.is_action_just_released("start"):
			shooting = false
			$Line2D.points[1] = Vector2(0,0)
			shoot()
		elif shooting and Input.is_action_pressed("start"):
			var vec = (get_viewport().get_mouse_position() - mstart)
			$Line2D.points[1] = vec.normalized() * min(200, vec.length())

func shoot():
	shot = true
	var vec = (get_viewport().get_mouse_position() - mstart)
	vec = vec.normalized() * min(200, vec.length())
	gravity_scale = 5
	linear_velocity = -Vector2(vec.x * 10, vec.y * 6)

func _physics_process(delta):
	if shot:
		if linear_velocity.length_squared() < 100:
			queue_free()
			$"..".spawn_bird()
		if not collided:
			angular_velocity = 0
			look_at(linear_velocity + global_position)
