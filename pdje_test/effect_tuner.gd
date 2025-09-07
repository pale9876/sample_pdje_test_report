@tool
extends Panel
class_name FXTuner

@export var active: bool = false: set = set_active
@export var fx_type: EnumWrapper.PDJE_FX_LIST: set = set_type

@onready var label: Label = $MarginContainer/HBoxContainer/Label
@onready var slider: HSlider = $MarginContainer/HBoxContainer/HSlider

func _ready() -> void:
	slider.value_changed.connect(_value_changed)

func _value_changed(value: float) -> void:
	var min_value: float = slider.min_value
	if value > min_value:
		active = true

func set_type(type: EnumWrapper.PDJE_FX_LIST) -> void:
	fx_type = type
	var str_fx_type: StringName = FXContainer.fx_list[type]
	name = StringName(str_fx_type + &"Tuner")
	if label != null: label.text = str(str_fx_type)

func set_active(toggle: bool) -> void:
	active = toggle
	
	if Engine.is_editor_hint(): return
	
	if toggle:
		visible = true
	else:
		visible = false
