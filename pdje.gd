extends Node

var engine: PDJE_Wrapper
var editor: EditorWrapper
var player: PlayerWrapper
var muspanel: MusPannelWrapper

var turn_on = false

var db_root: String = "res://rootdb"
var editor_path: String = "C://Users/ssh/Documents/pdje_test/editor/"
var song_name: String = "miku_temp"
var composer: String = "hatsune"
var track_title: String = "Vocaro"
var music_path: String = "res://musics/miku_temp.wav"

func _ready() -> void:
	engine = PDJE_Wrapper.new()
	
	print("InitEngine :: ", engine.InitEngine(db_root)) # InitEngine First
	
	var search_is_empty: bool = engine.SearchMusic(song_name, composer).is_empty()
	print("Search Is Empty :: ", search_is_empty)
	
	if search_is_empty:
		if engine.InitEditor("anon", "sss@gmail.com", editor_path):
			editor = engine.GetEditor()
			
			print("Config New Music :: ", editor.ConfigNewMusic(song_name, composer, music_path))
			
			var edit_args: PDJE_EDITOR_ARG = PDJE_EDITOR_ARG.new()
			edit_args.InitMusicArg(song_name, "120", 0, 0, 4)
			editor.AddLine(edit_args)
			editor.render(track_title)
			editor.pushToRootDB(song_name, composer)
			editor.pushTrackToRootDB(track_title)
	
	print("Init Player :: ", engine.InitPlayer(PDJE_Wrapper.FULL_MANUAL_RENDER, "void", 48))
	player = engine.GetPlayer()
	
	print("Player Activate :: ", player.Activate())
	muspanel = player.GetMusicControlPannel()
	print("Load Music :: ", muspanel.LoadMusic(song_name, composer, 120)) 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if turn_on:
			print("stopped")
			print("SetMusic:: ", muspanel.SetMusic(song_name, false))
			turn_on = false
		else:
			print("playback")
			print("SetMusic:: ", muspanel.SetMusic(song_name, true)) # result:: false?? Why?
			print(muspanel.GetLoadedMusicList()) ## Troubled Where
			turn_on = true
