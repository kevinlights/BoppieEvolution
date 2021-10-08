extends TextureRect

var height = 150
var width = 300
var curr_index = 0
var plot = Image.new()
var owlie_pixel_indeces = []
var kloppie_pixel_indeces = []

func _ready():
	plot.create(width, height, false, Image.FORMAT_RGBA8)
	plot.fill(Color(1, 1, 1, .1))
	self.texture = ImageTexture.new()
	rect_size = Vector2(width, height)
	rect_min_size = Vector2(width, height)
	update()
	for i in range(width):
		owlie_pixel_indeces.append(0)
		kloppie_pixel_indeces.append(0)
	
	$Timer.connect("timeout", self, "_on_HalfSecondTimer")
	#Globals.connect("HalfSecondTimer", self, "_on_HalfSecondTimer")
	
func _on_HalfSecondTimer():
	draw_next_pixel()

func draw_next_pixel():
	var owlies = get_tree().get_nodes_in_group("Owlie").size()
	var kloppies = get_tree().get_nodes_in_group("Kloppie").size()
	plot.lock()
	plot.set_pixel(curr_index, owlie_pixel_indeces[curr_index], Color(0, 0, 0, 0))
	plot.set_pixel(curr_index, kloppie_pixel_indeces[curr_index], Color(0, 0, 0, 0))
	plot.set_pixel(curr_index, height - owlies, Color.green)
	plot.set_pixel(curr_index, height - kloppies, Color.cyan)
	plot.unlock()
	texture.create_from_image(plot)
	owlie_pixel_indeces[curr_index] = height - owlies
	kloppie_pixel_indeces[curr_index] = height - kloppies
	curr_index = (curr_index + 1) % width

