extends Area2D

# 20 个尖刺
var spikes = 20
var radius = 15
var bloodiness = 0

func _draw():
	var diff = 2.0*PI/spikes
	for i in range(spikes):
		var a = i * diff
		var points = [
			radius * Vector2(cos(a), sin(a)), 
			radius * Vector2(cos(a + diff), sin(a + diff)),
			1.5 * radius * Vector2(cos(a + diff / 2), sin(a + diff / 2)),
		]
		draw_colored_polygon(points, Color.white)
		if not Globals.performance_mode:
			if Globals.rng.randf() * spikes < bloodiness:
				var index = Globals.rng.randi() % 2
				var angle = a + (diff * 0.6 if index == 0 else 0) + diff * (Globals.rng.randf() * .4 + .1)
				points[index] = radius * Vector2(cos(angle), sin(angle))
				draw_colored_polygon(points, Color.red)
	draw_circle(Vector2.ZERO, radius, Color.black)

func _process(delta):
	if not Globals.performance_mode:
		rotation += PI * delta

# 碰到陷阱时，波比受到伤害 12， 并触发流血状态
func _on_Trap_body_entered(body):
	if body is Boppie:
		body.take_damage(12)
		bloodiness = min(bloodiness + 1, spikes)
		if not Globals.performance_mode:
			update()
