/// @func thinker_get_room_layers()
/// @desc Gets all layers in the current room as a struct with each layer's name as the key and ID as the value.
/// @returns {struct} A struct containing the layers of the current room, with each key being a layer name and the value being the corresponding layer ID.
function thinker_get_room_layers(){
	var layers = {};
	var layer_ids = layer_get_all();
	for (var i = 0; i < array_length(layer_ids); i++) {
		var current_id = layer_ids[i];
		var current_name = layer_get_name(current_id);
		variable_struct_set(layers, layer_name, current_name);
	}
}
