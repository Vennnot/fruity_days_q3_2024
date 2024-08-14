@tool
extends Node

@onready var timer = %Timer
@onready var label = %Label
@onready var fade_timer = %FadeTimer
@onready var color_rect = %ColorRect

var mode : int = 0

var messages_mode_time : float = 10
var rest_eyes_time : float = 20

func _ready():
	match mode:
		0:
			timer.wait_time = messages_mode_time
		1:
			timer.wait_time = rest_eyes_time


func _on_timer_timeout():
	match mode:
		0:
			message()
		1:
			rest_eyes()


func rest_eyes():
	color_rect.visible = true
	label.text = "Eye break!"
	randomize()
	if randi_range(0,3)>2:
		label.text = "run"
	label.visible = true
	fade_timer.start()


func message():
	label.text = get_random_message()
	label.visible = true
	fade_timer.start()


func get_random_message()->String:
	randomize()
	var messages : PackedStringArray = ["They are watching you 👁️👁️",
	"Sometimes a break helps us be even more productive",
	"A little positivity goes a long way",
	"The best exercise for the mind is movement!",
	"They are listening in on your calls 👂👂",
	"Stretching time!",]
	return messages[randi_range(0, messages.size()-1)]

func _on_fade_timer_timeout():
	label.visible = false
	color_rect.visible = false
