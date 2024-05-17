extends Control
var Restart = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.Game_over.connect(game_over)
	
func _process(delta):
	if Input.is_action_just_pressed("jump")and Restart:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://level/main.tscn")

func game_over():
	visible = true
	$Timer.start()
	

func _on_timer_timeout():
	$VBoxContainer/Label2.visible = true
	Restart = true
