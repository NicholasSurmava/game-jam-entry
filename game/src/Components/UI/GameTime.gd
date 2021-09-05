extends Node2D

func _ready():
	$Timer.start()

func _process(delta: float) -> void:
	$TimerLabel.text = "Time: " + str(int($Timer.time_left))

func _on_Timer_timeout() -> void:
	$Timer.stop()
	print("game over")
