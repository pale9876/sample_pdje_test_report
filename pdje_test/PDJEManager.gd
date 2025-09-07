extends Node

const db_root: String = "res://rootdb"
const editor_path: String = "res://editor/"

var engine: PDJE_Wrapper = null
var editor: EditorWrapper = null
var player: PlayerWrapper = null
var muspanel: MusPannelWrapper = null


func _enter_tree() -> void:
	engine = PDJE_Wrapper.new()
	engine.InitEngine(db_root)

func _exit_tree() -> void:
	engine.CloseEditor()

func search_song(song_name: String, composer: String) -> bool:
	return engine.SearchMusic(song_name, composer).is_empty()
