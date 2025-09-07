extends Node

var editor: EditorWrapper = null
var engine: PDJE_Wrapper = null
var player: PlayerWrapper = null
var muspanel: MusPannelWrapper = null


var db_root: String = "res://rootdb"
var editor_path: String = "res://editor/"
var song_name: String = "miku_temp"
var composer: String = "hatsune"
var track_title: String = "Vocaro"
var music_path: String = "res://musics/miku_temp.wav"

var turn_on = false

func _init() -> void:
	engine = PDJE_Wrapper.new()
	print("InitEngine :: ", engine.InitEngine(db_root)) # InitEngine First

func _ready() -> void:
	if search():
		if engine.InitEditor("anon", "sss@gmail.com", editor_path):
			editor = engine.GetEditor()
			
			print("Config New Music :: ", editor.ConfigNewMusic(song_name, composer, music_path))
			
			var edit_args: PDJE_EDITOR_ARG = PDJE_EDITOR_ARG.new()
			edit_args.InitMusicArg(song_name, "120", 0, 0, 4)
			editor.AddLine(edit_args)
			
			editor.render(track_title)
			
			editor.pushToRootDB(song_name, composer)
			editor.pushTrackToRootDB(track_title)
			
			engine.CloseEditor()

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

func get_fx_wrapper() -> EnumWrapper.PDJE_FX_LIST:
	return EnumWrapper.ECHO

func search() -> bool:
	return engine.SearchMusic(song_name, composer).is_empty()

func get_fxhandle_immediately() -> FXWrapper:
	return muspanel.getFXHandle(song_name)
