/// @func thinker_miniscraper_colliding_list(x, y, collision_layer)
/// @desc Gets an array of collision instances at a specified position on a specified layer
/// @arg {real} x The x position to get the instances at
/// @arg {real} y The y position to get the instances at
/// @arg {layer_id} collision_layer The layer on which to get the instances
function thinker_miniscraper_colliding_list(x, y, collision_layer) {
	var collision_instances = [];
	
	var collision_list = ds_list_create();
	instance_position_list(x, y, thinker_miniscraper_obj_collision, collision_list, false);
	
	for (var i = 0; i < ds_list_size(collision_list); i++) {
		var current = collision_list[| i];
		if (current.layer == collision_layer)
			array_push(collision_instances, current);
	}
	
	ds_list_destroy(collision_list);
	return collision_instances;
}

/// @func thinker_miniscraper_colliding_any(x, y, collision_layer)
/// @desc Gets whether any collision is found at a specified position on a specified layer
/// @arg {real} x The x position to get collision at
/// @arg {real} y The y position to get collision at
/// @arg {layer_id} collision_layer The layer on which to get collision
function thinker_miniscraper_colliding_any(x, y, collision_layer) {
	var collision_list = ds_list_create();
	instance_position_list(x, y, thinker_miniscraper_obj_collision, collision_list, false);
	
	var success = false;
	for (var i = 0; i < ds_list_size(collision_list); i++) {
		var current = collision_list[| i];
		if (current.layer == collision_layer) {
			success = true;
			break;
		}
	}
	
	ds_list_destroy(collision_list);
	return success;
}