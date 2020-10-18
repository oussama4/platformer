tool
extends Button


export(String, FILE) var next_scene


func _get_configuration_warning() -> String:
	return "next scene is required" if next_scene == "" else ""

func _on_button_up() -> void:
	get_tree().change_scene(next_scene)
