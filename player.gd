extends CharacterBody2D

const SPEED = 300.0
const ACCELERATION = 1500
const FRICTION = 600
@onready var icon = $Icon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_movement(input, delta):
	if input:
		velocity = velocity.move_toward(input * SPEED , delta * ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)

func _physics_process(delta):
	var input = Input.get_vector("up", "down", "right", "left")
	player_movement(input, delta)
	move_and_slide()

	# Calculate the speed based on the length of the velocity vector
	var speed = velocity.length()

	if speed > 1:
		icon.animation = "running"
	else:
		icon.animation = "default"

	look_at(get_global_mouse_position())
