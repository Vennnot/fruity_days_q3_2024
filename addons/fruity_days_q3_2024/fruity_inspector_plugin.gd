@tool
class_name FruityInspectorPlugin
extends EditorInspectorPlugin

var color_rect : ColorRect

func _enter_tree():
	# Create and configure the ColorRect
	color_rect = ColorRect.new()
	color_rect.color = Color(1, 1, 1, 0.5) # Semi-transparent white
	color_rect.rect_min_size = Vector2(300, 300) # Adjust size if needed

	# Add the ColorRect to the inspector
	add_control_to_container(EditorInspectorPlugin.CONTAINER_BODY, color_rect)

	# Update the ColorRect size to cover the inspector
	_update_color_rect_size()

func _notification(what):
	if what == Notification.RESIZED:
		_update_color_rect_size()

func _update_color_rect_size():
	# Make sure the ColorRect covers the whole inspector
	var inspector_size = get_viewport().size
	color_rect.rect_size = inspector_size

func _exit_tree():
	# Clean up when exiting the plugin
	if color_rect:
		remove_control_from_container(EditorInspectorPlugin.CONTAINER_BODY, color_rect)
