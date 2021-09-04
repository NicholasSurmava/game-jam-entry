extends Node

onready var playerCamera = $Player/Camera2D

func _ready() -> void:
	if self.name != "MainMenu":
		playerCamera.current = true
