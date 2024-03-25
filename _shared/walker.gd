extends Node3D

# If you would like to see a proper character controller,
# see https://github.com/alexjhetherington/godot-character-controller-example

var step_interval = 2
var travel_speed = 1

var _current = 0

func _process(delta):
	_current -= delta

	while (_current < 0):
		_current += step_interval
		get_child(0).step()

	global_position += -global_transform.basis.z * travel_speed * delta
