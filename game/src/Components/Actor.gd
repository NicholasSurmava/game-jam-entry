extends KinematicBody2D
class_name Actor

const bulletPath = preload("res://src/Components/Bullet/Bullet.tscn")

export (bool) var movement = true
export (bool) var active = true

export (int) var SPEED = 500
export (int) var GRAVITY = 2000
export (int) var JUMP_FORCE = -850

var velocity = Vector2.ZERO
var direction:int
