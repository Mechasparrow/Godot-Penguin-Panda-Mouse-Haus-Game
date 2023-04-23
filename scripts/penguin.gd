class_name Penguin extends AnimatedSprite2D

var timeline : DialogicTimeline = load("res://timeline.dtl")

func _ready():
	Dialogic.start_timeline(timeline)

var waddle_side = "none"

func apply_waddle():
	if waddle_side == "none":
		waddle_side = "right"
		return 

	if (waddle_side == "right"):
		waddle_side = "left"
	else:
		waddle_side = "right"
	
func update_waddle_rotation():
	if (waddle_side == "none"):
		rotation_degrees = 0
	elif (waddle_side == "right"):
		rotation_degrees = 10
	else:
		rotation_degrees = -10

func handle_input():
	if (Input.is_action_just_pressed("right")):
		return "right"
	if (Input.is_action_just_pressed("up")):
		return "up"
	if (Input.is_action_just_pressed("down")):
		return "down"
	if (Input.is_action_just_pressed("left")):
		return "left"
	
	return "none"

func get_position_offset(direction):
	if direction == "left":
		return Vector2(-10,0)
	elif direction == "right":
		return Vector2(10,0)
	elif direction == "down":
		return Vector2(0,10)
	elif direction == "up":
		return Vector2(0,-10)
	else:
		return Vector2(0,0)

func _process(delta):
	var direction = handle_input() as String

	if (direction != "none"):
		animation = direction
		apply_waddle()
		update_waddle_rotation()

		var offset = get_position_offset(direction)
		position += offset
	
