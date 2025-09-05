@tool
extends VBoxContainer
class_name FXTuner

@export var fx_type: EnumWrapper.PDJE_FX_LIST: set = set_type

@onready var label: Label = $Label

func _enter_tree() -> void:
	pass


func _ready() -> void:
	pass


func set_type(type: EnumWrapper.PDJE_FX_LIST) -> void:
	fx_type = type
	
	#name = StringName(str()) + "Tuner"
