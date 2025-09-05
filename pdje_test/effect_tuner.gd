@tool
extends VBoxContainer
class_name FXTuner

#enum PDJE_FX_LIST:
#
#● COMPRESSOR = 0
#● DISTORTION = 1
#● ECHO = 2
#● EQ = 3
#● FILTER = 4
#● FLANGER = 5
#● OCSFILTER = 6
#● PANNER = 7
#● PHASER = 8
#● ROBOT = 9
#● ROLL = 10
#● TRANCE = 11
#● VOL = 12

const fx_list: Dictionary[EnumWrapper.PDJE_FX_LIST, String] = {
	EnumWrapper.PDJE_FX_LIST.COMPRESSOR : "Compressor",
	EnumWrapper.PDJE_FX_LIST.DISTORTION : "Distortion",
	EnumWrapper.PDJE_FX_LIST.ECHO : "Echo",
	EnumWrapper.PDJE_FX_LIST.EQ : "EQ",
	EnumWrapper.PDJE_FX_LIST.FILTER : "Filter",
	EnumWrapper.PDJE_FX_LIST.FLANGER : "Flanger",
	EnumWrapper.PDJE_FX_LIST.OCSFILTER : "OCSFilter",
	EnumWrapper.PDJE_FX_LIST.PANNER : "Panner",
	EnumWrapper.PDJE_FX_LIST.PHASER : "Phaser",
	EnumWrapper.PDJE_FX_LIST.ROBOT : "Robot",
	EnumWrapper.PDJE_FX_LIST.ROLL : "Roll",
	EnumWrapper.PDJE_FX_LIST.TRANCE : "Trance",
	EnumWrapper.PDJE_FX_LIST.VOL : "Vol",
}

@export var active: bool = false
@export var fx_type: EnumWrapper.PDJE_FX_LIST: set = set_type

@onready var label: Label = $Label
@onready var slider: VSlider = $VSlider

func _enter_tree() -> void:
	pass


func _ready() -> void:
	slider.value_changed.connect(_value_changed)

func _value_changed(value: float) -> void:
	pass

func set_type(type: EnumWrapper.PDJE_FX_LIST) -> void:
	fx_type = type
	var str_fx_type: String = fx_list[type]
	name = StringName(str_fx_type) + "Tuner"
	if label == null: label.text = str_fx_type

func set_active(toggle: bool) -> void:
	active = toggle
