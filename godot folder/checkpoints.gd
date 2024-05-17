extends Area2D

@export var checky = 0
@export var checkx = 0
var checkpointactive = false
var anim = false


func deactivatecheckpoints():
	var checkpoints = get_tree().get_first_node_in_group("checkpoints")
	for checkpoint in checkpoints.get_children():
		checkpoint.checkpointactive = false
func _on_body_entered(body):
	if anim == false:
		if body.is_in_group("player"):
			anim = true
			deactivatecheckpoints()
			checkpointactive = true
			$AnimatedSprite2D.play("claim")
			checky = position.y
			checkx = position.x
