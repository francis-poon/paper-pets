extends Node2D

@export var texture : Texture2D:
	set(value):
		texture = value
		queue_redraw()

@export var viewport: SubViewport
@export var sprite: Sprite2D
@export var sprite2: Sprite2D

var time_passed: float
var iteration: int

func _ready():
	
	sprite.draw.connect(_sprite_draw)
	sprite.queue_redraw()
	time_passed = 0
	iteration = 0
	var image: Image = texture.get_image()
	image.set_pixel(0, 0, Color.BLACK)
	texture = ImageTexture.create_from_image(image)

func _sprite_draw():
	sprite.draw_circle(Vector2.ZERO, 50, Color.ALICE_BLUE)
	sprite2.texture = sprite.texture
	
#func _draw():
	#sprite.draw_circle(Vector2(sprite.position.x + int(sprite.get_rect().size.x / 2), sprite.position.y + int(sprite.get_rect().size.y / 2)), 500, Color.ALICE_BLUE)
	#draw_texture(texture, Vector2())
	
#func _process(delta):
	#time_passed += delta
	#while time_passed > 0.1 and iteration < texture.get_width():
		#time_passed -= 0.1
		#var image: Image = texture.get_image()
		#var image_size = image.get_size()
		##var draw_x = iteration % image_size.x
		##var draw_y = int(iteration / image_size.y)
		#for i in range(iteration + 1):
			#var draw_x = i
			#var draw_y = iteration - i
			#print("{0}, {1}".format([draw_x, draw_y]))
			#image.set_pixel(draw_x, draw_y, Color.BLACK)
		#texture = ImageTexture.create_from_image(image)
		#iteration += 1
