extends Area2D

var newcheckpoint
func findcheck():
	var checkpoints = get_tree().get_first_node_in_group("checkpoints")
	for checkpoint in checkpoints.get_children():
		if checkpoint.checkpointactive == true:
			newcheckpoint = checkpoint
func _on_body_entered(body):
		if body.is_in_group("player"):
			findcheck()
			body.position.y = newcheckpoint.checky
			body.position.x = newcheckpoint.checkx
			
