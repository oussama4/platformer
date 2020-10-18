extends Control


var paused: = false setget set_paused

onready var scene_tree: = get_tree()
onready var pause_overlay: = $PauseOverlay
onready var game_over_overlay: = $GameOverOverlay
onready var score_label: = $Score


func _ready() -> void:
	Global.connect("score_updated", self, "update_ui")
	Global.connect("player_died", self, "on_player_died")
	update_ui()


func update_ui() -> void:
	score_label.text = "Score: %s" % Global.score


func on_player_died() -> void:
	self.paused = true
	game_over_overlay.visible = true


func _on_Resume_button_up() -> void:
	self.paused = false
	pause_overlay.visible = paused


func _on_Retry_button_up() -> void:
	self.paused = false
	game_over_overlay.visible = paused
	scene_tree.reload_current_scene()
	Global.died = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and not Global.died:
		self.paused = not paused
		pause_overlay.visible = paused


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
