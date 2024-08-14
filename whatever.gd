extends Node2D

# Declare variables
var speed = 200
var velocity = Vector2()

@onready var icon = %Icon

# Use _process() for non-physics-based updates
func _process(delta):
	velocity = Vector2()  # Reset velocity each frame

	# Movement input (arrow keys or WASD)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Normalize vector to avoid diagonal speed boost
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# Move the sprite
	icon.position += velocity * delta
