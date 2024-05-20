extends Reference

# AI 抽象类
# 子类实现移动和转向逻辑
# 并可增加变异功能
class_name AI

func get_movement_factor(_ai_input=null):
	return 0
	
func get_turn_factor(_ai_input=null):
	return 0

func mutate(property: String, mutability: float):
	pass
