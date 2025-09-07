@tool
extends Control
class_name FXContainer

const fx_list: Dictionary[EnumWrapper.PDJE_FX_LIST, StringName] = {
	EnumWrapper.PDJE_FX_LIST.COMPRESSOR : &"Compressor",
	EnumWrapper.PDJE_FX_LIST.DISTORTION : &"Distortion",
	EnumWrapper.PDJE_FX_LIST.ECHO : &"Echo",
	EnumWrapper.PDJE_FX_LIST.EQ : &"EQ",
	EnumWrapper.PDJE_FX_LIST.FILTER : &"Filter",
	EnumWrapper.PDJE_FX_LIST.FLANGER : &"Flanger",
	EnumWrapper.PDJE_FX_LIST.OCSFILTER : &"OCSFilter",
	EnumWrapper.PDJE_FX_LIST.PANNER : &"Panner",
	EnumWrapper.PDJE_FX_LIST.PHASER : &"Phaser",
	EnumWrapper.PDJE_FX_LIST.ROBOT : &"Robot",
	EnumWrapper.PDJE_FX_LIST.ROLL : &"Roll",
	EnumWrapper.PDJE_FX_LIST.TRANCE : &"Trance",
	EnumWrapper.PDJE_FX_LIST.VOL : &"Vol",
}

@export var _effects: Dictionary[StringName, FXTuner]

@export_tool_button("Call Update", "VBoxContainer")
var call_update: Callable = _update

@onready var container: VBoxContainer = $CenterContainer/Panel/MarginContainer/HSplitContainer/MarginContainer/Container

func _init() -> void:
	_effects = {
		&"Compressor" : null,
		&"Distortion" : null,
		&"Echo" : null,
		&"EQ" : null,
		&"Filter" : null,
		&"Flanger" : null,
		&"OCSFilter" : null,
		&"Panner" : null,
		&"Phaser" : null,
		&"Robot" : null,
		&"Roll" : null,
		&"Trance" : null,
		&"Vol" : null,
	}

func _ready() -> void:
	_update()

func _update() -> void:
	_effects.clear()
	
	var tuners: Array[FXTuner] = _get_tuner()
	#print(tuners)
	
	for tuner: FXTuner in _get_tuner():
		var fx_type: StringName = fx_list[tuner.fx_type]
		if _effects.has(fx_type):
			printerr("Tuner가 이미 존재합니다.")
			tuner.active = false
		else:
			_effects[fx_type] = tuner
			tuner.active = true

func _get_activates() -> Array[FXTuner]:
	var result: Array[FXTuner] = []
	
	for fx_name: StringName in _effects:
		var fx_node: FXTuner = _effects[fx_name] if _effects[fx_name] != null else null
		if _effects[fx_name].active and fx_node != null:
			result.push_back(fx_node)
	
	return result

func _get_tuner() -> Array[FXTuner]:
	var result: Array[FXTuner] = []
	
	for node: Node in container.get_children():
		if node is FXTuner:
			result.push_back(node)
	
	return result
