@tool
extends EditorScenePostImport

func _post_import(scene):

	var original_mesh := scene.get_child(0).mesh as Mesh

	for surface_index in original_mesh.get_surface_count():

		var mesh_data_tool = MeshDataTool.new()
		mesh_data_tool.create_from_surface(original_mesh, surface_index)

		var mesh_instance = MeshInstance3D.new()
		var mesh = ArrayMesh.new()
		mesh_data_tool.commit_to_surface(mesh)

		mesh_instance.mesh = mesh
		mesh_instance.create_trimesh_collision()

		mesh_instance.name = "Mesh" + str(surface_index)
		scene.add_child(mesh_instance)

		# If you inherit the plane.glb scene you can see the full hierarchy
		mesh_instance.set_owner(scene)
		mesh_instance.get_child(0).set_owner(scene)
		mesh_instance.get_child(0).get_child(0).set_owner(scene)

	scene.get_child(0).queue_free()

	return scene

