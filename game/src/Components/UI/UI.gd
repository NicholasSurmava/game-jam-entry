extends CanvasLayer

onready var score = $Score
onready var hearts = $Hearts

func _process(delta):
	score.text = "Score: " + str(Global.SCORE)
	hearts.text = "Hearts: " + str(Global.CURRENT_HEALTH) + "/" + str(Global.TOTAL_HEALTH)
	
	if Global.CURRENT_HEALTH == 0:
		$RestartPrompt.visible = true
		if Input.is_action_just_pressed("restart"):
			Global.SCORE = 0
			Global.CURRENT_HEALTH = Global.TOTAL_HEALTH
			get_tree().change_scene("res://src/Core/MainMenu.tscn")
			
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			$Paused.visible = true
			get_tree().paused = true
		else:
			$Paused.visible = false
			get_tree().paused = false
		
	
