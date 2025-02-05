extends Node2D

@export var brush_size: int

var texture: Texture2D

func _ready() -> void:
	#var image: Image = get_viewport().get_texture().get_image()
	#
	#image.fill_rect(Rect2(Vector2(-10, -10), Vector2(50, 50)), Color.WHITE)
	#image.set_pixel(10, 10, Color.RED)
	#texture = ImageTexture.create_from_image(image)
	texture = ImageTexture.create_from_image(get_viewport().get_texture().get_image())
	queue_redraw()

func _draw() -> void:
	draw_texture(texture, Vector2.ZERO)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("draw", true):
		print("ble" + str(event.position))
		var image: Image = texture.get_image()
		var mouse_pos = event.position
		image.fill_rect(Rect2i(Vector2i(mouse_pos.x - brush_size/2, mouse_pos.y - brush_size/2), Vector2(brush_size, brush_size)), Color.WHITE)
		texture = ImageTexture.create_from_image(image)
		queue_redraw()
	
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("bla")
		var image: Image = texture.get_image()
		var mouse_pos = event.position
		image.fill_rect(Rect2i(Vector2i(mouse_pos.x - brush_size/2, mouse_pos.y - brush_size/2), Vector2(brush_size, brush_size)), Color.WHITE)
		texture = ImageTexture.create_from_image(image)
		queue_redraw()
	
	if event.is_action_pressed("save"):
		print("saving")
		var image: Image = texture.get_image()
		image.save_png("res://test/drawing/output/" + str(randi()) + ".png")
