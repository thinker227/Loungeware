/// @func thinker_ArrayIterator(array)
/// @desc An iterator iterating through an array
/// @arg {array} array The array to iterate through
function thinker_ArrayIterator(array) {
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
		if (current >= length) return undefined;
		return array[current];
	}
}
