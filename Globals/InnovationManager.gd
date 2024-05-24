extends Node

var innovation_id = 0 # 每次添加一个创新，都向后递增 1
# 0th element is ignored 
var innovations: Array = [["Input", "Output"]] # 第一个只作为示例，表示每个元素必须要有输入和输出，整体构成二维数组
var common_innovation_ids: Array = []
var fully_connected_neurons: int = 0
var max_ray_count_additional = 2
var danger_sense_parts = 4
var nn_input_initial_neurons = []
var nn_input_neurons = []
var nn_output_neurons = ["Move", "Turn"]
var senses_configuration = {
	Data.Sense.BIAS: Data.SenseConfiguration.new("Bias", false), # 偏置
	Data.Sense.VISION_RAY_EATS: Data.SenseConfiguration.new("VisionRayEats", true, 5), # 视线发现食物
	Data.Sense.DANGER_SENSE: Data.SenseConfiguration.new("DangerSense", true, 4), # 危险感知
	# Data.Sense.MEMORY: Data.SenseConfiguration.new("Memory", false), # 记忆
	Data.Sense.TIMER: Data.SenseConfiguration.new("Timer", false), # 定时
	Data.Sense.HUNGER: Data.SenseConfiguration.new("Hunger"), # 饥饿
	Data.Sense.THIRST: Data.SenseConfiguration.new("Thirst"), # 口渴
	Data.Sense.WATER_RAY: Data.SenseConfiguration.new("Water"), # 含水量
	Data.Sense.GROUND: Data.SenseConfiguration.new("Ground", true, 2), # 在地面上
	Data.Sense.ALLY_SENSE: Data.SenseConfiguration.new("AllySense", false, 4), # 所有传感器
}

func add_innovation(input: String, output: String) -> int:
	innovation_id += 1
	innovations.append([input, output])
	return innovation_id
	
func initialize_nn_input_neurons():
	assert(nn_input_neurons == [])
	assert(nn_input_initial_neurons == [])
	for sense in senses_configuration:
		var config = senses_configuration[sense]
		for i in range(1, config.count + 1):
			var name = config.string
			if config.count > 1:
				name += str(i)
			nn_input_neurons.append(name) # 多于一个时，对名称添加序号
			if config.in_initial: # 取最后一个
				nn_input_initial_neurons.append(nn_input_neurons[ - 1])
	
func get_nn_input_neurons_deprecated(): # 废弃方法
	var input_neurons = []
	input_neurons.append("Hunger") # Hunger
	#nn_input_initial_neurons.append(input_neurons[-1])
	for i in range(1 + 2 * max_ray_count_additional):
		input_neurons.append("VisionRayEats" + str(i))
		nn_input_initial_neurons.append(input_neurons[ - 1])
	for i in range(danger_sense_parts):
		input_neurons.append("DangerSense" + str(i))
		#nn_input_initial_neurons.append(input_neurons[-1])
	input_neurons.append("Timer1")
	input_neurons.append("Water1") # Thirst
	nn_input_initial_neurons.append(input_neurons[ - 1])
	input_neurons.append("Water2") # Water
	nn_input_initial_neurons.append(input_neurons[ - 1])
	input_neurons.append("Ground1") # Current ground
	nn_input_initial_neurons.append(input_neurons[ - 1])
	input_neurons.append("Ground2") # Ahead ground
	nn_input_initial_neurons.append(input_neurons[ - 1])
	for i in range(danger_sense_parts):
		input_neurons.append("AllySense" + str(i))
		#nn_input_initial_neurons.append(input_neurons[-1])
	input_neurons.append("Bias")
	return input_neurons

func _ready() -> void:
	# Bias neuron should be connected to every neuron without the need for innovations
	initialize_nn_input_neurons()
	make_initial_innovations(nn_input_initial_neurons)
	
func make_initial_innovations(inputs):
	if fully_connected_neurons > 0:
		var hidden_neurons = []
		for i in range(fully_connected_neurons):
			hidden_neurons.append("HiddenNeuron" + str(i))
		for hidden_neuron in hidden_neurons:
			for input in inputs:
				var innovation_id = add_innovation(input, hidden_neuron)
				common_innovation_ids.append(innovation_id)
		inputs = hidden_neurons
	for output_neuron in nn_output_neurons:
		for input in inputs:
			var innovation_id = add_innovation(input, output_neuron)
			common_innovation_ids.append(innovation_id)
