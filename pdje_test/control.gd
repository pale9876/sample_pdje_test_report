@tool
extends Control
class_name FXContainer

@onready var container: HBoxContainer = $CenterContainer/MarginContainer/Container

@export_tool_button("Call Update", "VBoxContainer")
var call_update: Callable = _update

func _ready() -> void:
	pass

func _update() -> void:
	pass

func _get_tuner() -> Array:
	return []
