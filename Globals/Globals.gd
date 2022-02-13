extends Node


var current_food_count := 0
var draw_vision_rays := false
var draw_current_vision_rays := false
var boppies_died := 0
var boppies_born := 0
var boppies_spawned := 0
var nn_thread: Thread = Thread.new()
var elapsed_time := 0.0
var dna_clipboard = null
var kloppies_cannibals = false
var use_random_seed = false


var rng = RandomNumberGenerator.new()

func _ready():
	if use_random_seed:
		rng.randomize()
	else:
		var random_seed = 0xface
		rng.seed = random_seed
	
	
signal PerformanceModeChanged(value)
var performance_mode = false setget set_performance_mode
func set_performance_mode(new_value):
	if performance_mode != new_value:
		performance_mode = new_value
		emit_signal("PerformanceModeChanged", new_value)


signal HalfSecondTimer
var last_emit_time = 0

func _process(delta):
	elapsed_time += delta
	if last_emit_time + 500 < OS.get_ticks_msec():
		last_emit_time = OS.get_ticks_msec()
		emit_signal("HalfSecondTimer")

func formatted_time(seconds = null):
	if seconds == null:
		seconds = int(elapsed_time)
	return "%02d:%02d:%02d" % [seconds / 3600, (seconds / 60) % 60, seconds % 60]

signal DifficultyChanged(new_value)
var difficulty = .3 setget set_difficulty

func set_difficulty(new_value):
	difficulty = new_value
	emit_signal("DifficultyChanged", difficulty)
