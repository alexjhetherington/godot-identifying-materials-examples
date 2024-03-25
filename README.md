# Identifying Materials in Godot

In Godot, identifying which material is being displayed at an arbitrary point on an arbitrary mesh is not trivial. This repo contains some examples to help you learn how to do that.

Use cases include footstep sounds based on material, bullet impact sounds based on material etc.

This repo acts as a companion to my article: http://www.footnotesforthefuture.com/words/godot-identifying-materials/. Reading that may help you understand each implementation

# How To Read This Repo

The `_shared` folder contains images, resources, and helper scripts that are tangential to the task of identifying materials.

Each other folder contains an example implementation of how to identify materials:
* `camera_custom_material` - associate single flat colour with a material; material camera "sees" the original material as that single flat colour; read pixel colour to identify material
* `camera_duplicate_mesh` - associate single flat colour with a material; material camera renders a duplicated world with separate flat colour materials; read pixel colour to identify material
* `raycast_mesh_data_tool` - raycast into the world to determine appropriate mesh; manually test each mesh face to determine material
* `raycast_mesh_pre_process` - preprocess meshes to split them up per material; raycast into world to determine appropriate mesh; material is trivially the only material on the mesh

Each folder contains:
* `scene` - open and run to see the example in action (see log output)
* `stepper` - the `step()` function is called at set intervals; this function identifies the material below the camera and outputs it (or the colour) to the log
* `plane` - each example sets up the plane mesh slightly differently (materials; preprocessing; multiple meshes with material overrides)
* other items required for that implementation

# What's not in here
This repo does not contain any other game implementation code. For example, while the scenes are set up to mimick what checking for footstep sounds looks like, there is no character controller, nor mapping of material to sound etc.
