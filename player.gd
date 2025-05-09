extends CharacterBody2D

@export var speed = 400

var window_size: Vector2i
var DEFAULT_SIZE = Vector2i(24, 32)

func _ready():
	# 获取窗口大小
	window_size = get_viewport().get_visible_rect().size
	
	# 根据窗口大小设置初始位置
	var init_position = window_size / 2  # 将初始位置设定在屏幕正中央
	position = init_position
	
	# 根据窗口大小设置缩放等级
	var scale_level = int((window_size[1] / 10) / DEFAULT_SIZE[1])  # 将高度缩放至窗口高度的十分之一
	scale = Vector2i(scale_level, scale_level)


func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed


func _physics_process(delta):
	get_input()
	move_and_slide()
