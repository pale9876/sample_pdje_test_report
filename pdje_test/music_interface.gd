extends VBoxContainer

@onready var song_name_edit: LineEdit = $SongNameEdit
@onready var composer_edit: LineEdit = $ComposerEdit
@onready var show_hide_toggle: CheckBox = $ShowHideToggle

func _ready() -> void:
	show_hide_toggle.toggled.connect(_show_hide)

func _show_hide(toggle: bool) -> void:
	pass
