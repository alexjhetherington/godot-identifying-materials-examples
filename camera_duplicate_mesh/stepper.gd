extends Node

@export var viewport_texture : ViewportTexture

func step():
	var image = viewport_texture.get_image()
	var pixel_0_0 = image.get_pixel(0, 0)

	print("Material Colour:" + str(pixel_0_0))
	print(" ")
