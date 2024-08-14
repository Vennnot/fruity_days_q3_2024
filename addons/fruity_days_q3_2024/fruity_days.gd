@tool
extends EditorPlugin

# Path to the scene or script file that you want to use for your autoload
const AUTOLOAD_NAME = "FruityAutoLoad"

var inspector_plugin : EditorInspectorPlugin = null

func _enter_tree():
	# Add the autoload singleton
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/fruity_days_q3_2024/main.tscn")

func _exit_tree():
	# Remove the autoload singleton
	remove_autoload_singleton(AUTOLOAD_NAME)
