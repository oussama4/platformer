extends Area2D



func _on_body_entered(body: Node) -> void:
	$AnimationPlayer.play("fade_out")
