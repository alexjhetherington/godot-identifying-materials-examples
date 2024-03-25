extends Node3D


func step():
	#
	var mesh = get_mesh_using_raycast()
	if !mesh:
		return

	var surface_count = mesh.mesh.get_surface_count()
	if surface_count > 1:
		print("Material not found: this approach assumes meshes have been split so each has only one surface")
	else:
		var material = mesh.get_active_material(0)
		print("Material: " + material.resource_path.get_file())
	print(" ")


func get_mesh_using_raycast() -> MeshInstance3D:
	var space_state = get_world_3d().direct_space_state

	var origin = global_position + Vector3.UP
	var end = origin + 2 * Vector3.DOWN
	var query = PhysicsRayQueryParameters3D.create(origin, end)

	var result = space_state.intersect_ray(query)
	if result.has("collider"):
		var mesh := result["collider"].get_parent() as MeshInstance3D
		return mesh
	else:
		return null
