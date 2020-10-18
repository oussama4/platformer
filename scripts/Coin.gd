extends Area2D


export var score: = 100


func _on_body_entered(body: Node) -> void:
	$AnimationPlayer.play("fade_out")
	Global.score += score
