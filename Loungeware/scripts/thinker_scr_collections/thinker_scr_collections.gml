/// @func thinker_ArrayIterator(array)
/// @desc An iterator iterating through an array
/// @arg {array} array The array to iterate through
function thinker_ArrayIterator(array) constructor {
	self.array = [];
	current = -1;
	length = array_length(array);
	array_copy(self.array, 0, array, 0, length);
	
	
	
	/// @func next()
	/// @desc Moves the iterator one element of the array
	next = function() {
		current++;
		return current < length;
	}
	
	/// @func get_current()
	/// @desc Gets the current element in the array
	get_current = function() {
		if (current < 0 || current >= length) return undefined;
		return array[current];
	}
}

/// @func thinker_ListIterator(list)
/// @desc An iterator iterating through a list
/// @arg {list} list The list to iterate through
function thinker_ListIterator(list) constructor {
	self.list = ds_list_create();
	current = -1;
	length = ds_list_size(list);
	destroyed = false;
	ds_list_copy(self.list, list);
	
	
	
	/// @func next()
	/// @desc Moves the iterator one element of the list
	next = function() {
		current++;
		return current < length && !destroyed;
	}
	
	/// @func get_current()
	/// @desc Gets the current element in the list
	get_current = function() {
		if (destroyed || current < 0 || current >= length) return undefined;
		return list[| current];
	}
	
	/// @func destroy()
	/// @desc Destroys the internal list of the iterator, call this before a reference to the iterator is lost
	destroy = function() {
		if (destroyed) return;
		ds_list_destroy(list);
	}
}



/// @func thinker_array_to_list(array, [list])
/// @desc Converts an array to a list
/// @arg {array} array The array to convert
/// @arg {list} [list] The list to add the contents of the array to or a new list if not specified
function thinker_array_to_list(array, list = ds_list_create()) {
	var length = array_length(array);
	var i = 0;
	repeat(length) {
		var current = array[i];
		ds_list_add(list, current);
		i++;
	}
	return list;
}

/// @func thinker_list_to_array(list, [array])
/// @desc Converts a list to an array
/// @arg {list} list The list to convert
/// @arg {array} [array] The array to add the contents of the list to or a new array if not specified
function thinker_list_to_array(list, array = []) {
	var length = ds_list_size(list);
	var i = 0;
	repeat(length) {
		var current = list[| i];
		array_push(array, current);
		i++;
	}
	return array;
}
