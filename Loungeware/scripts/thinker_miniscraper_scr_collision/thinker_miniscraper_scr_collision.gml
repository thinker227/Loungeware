/// @func thinker_miniscraper_colliding_list(x1, y1, x2, y2, collision_layer)
/// @desc Gets an array of collision instances within a specified rectangle on a specified layer
/// @arg {real} x1 The left position of the rectangle to get the instances inside
/// @arg {real} y1 The top position of the rectangle to get the instances inside
/// @arg {real} x2 The right position of the rectangle to get the instances inside
/// @arg {real} y2 The bottom position of the rectangle to get the instances inside
/// @arg {layer_id} collision_layer The layer on which to get the instances
function thinker_miniscraper_colliding_list(x1, y1, x2, y2, collision_layer) {
	var collision_instances = [];
	
	var collision_list = ds_list_create();
	collision_rectangle_list(
		x1, y1, x2, y2,
		thinker_miniscraper_obj_collision, false, false,
		collision_list, false
	);
	
	if (ds_list_size(collision_list) > 0) {
		if (is_string(collision_layer)) collision_layer = layer_get_id(collision_layer);
		var iterator = new thinker_ListIterator(collision_list);
		while (iterator.next()) {
			var current = iterator.current();
			if (current.layer == collision_layer)
				array_push(collision_instances, current);
		}
		iterator.destroy();
	}
	
	ds_list_destroy(collision_list);
	return collision_instances;
}

/// @func thinker_miniscraper_colliding_any(x, y, collision_layer)
/// @desc Gets whether any collision is found within a specified rectangle on a specified layer
/// @arg {real} x1 The left position of the rectangle to get collision inside
/// @arg {real} y1 The top position of the rectangle to get collision inside
/// @arg {real} x2 The right position of the rectangle to get collision inside
/// @arg {real} y2 The bottom position of the rectangle to get collision inside
/// @arg {layer_id} collision_layer The layer on which to get collision
function thinker_miniscraper_colliding_any(x1, y1, x2, y2, collision_layer) {
	var success = false;
	
	var collision_list = ds_list_create();
	collision_rectangle_list(
		x1, y1, x2, y2,
		thinker_miniscraper_obj_collision, false, false,
		collision_list, false
	);
	
	if (ds_list_size(collision_list) > 0) {
		if (is_string(collision_layer)) collision_layer = layer_get_id(collision_layer);
		var iterator = new thinker_ListIterator(collision_list);
		while (!success && iterator.next()) {
			var current = iterator.get_current();
			if (current.layer == collision_layer)
				success = true;
		}
		iterator.destroy();
	}
	
	ds_list_destroy(collision_list);
	return success;
}