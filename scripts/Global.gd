extends Node


var score: = 0 setget set_score
var died: = false setget set_died

signal score_updated
signal player_died


func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")


func set_died(value: bool) -> void:
	died = value
	if value:
		emit_signal("player_died")
