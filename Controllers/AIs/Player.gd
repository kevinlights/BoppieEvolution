extends AI

# 由玩家控制的 AI，接收输入
class_name Player

func get_movement_factor(_ai_input=null):
	return Utils.input_vectors().y
	

func get_turn_factor(_ai_input=null):
	return -Utils.input_vectors().x
