extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.connect("DebugMessage", self, "_on_DebugMessage_PrintDebug")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DebugMessage_PrintDebug(msg):
	text = str(msg)
