tool
extends Area2D


export(String, FILE) var next_level
onready var anim_player: AnimationPlayer = $AnimationPlayer


func _get_configuration_warning() -> String:
	return "path to the next level scene is required" if next_level == "" else ""


func _on_body_entered(body: Node) -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene(next_level)
