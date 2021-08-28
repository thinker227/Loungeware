/// @func thinker_miniscraper_World(world_room)
/// @desc Provides functionality for a world
function thinker_miniscraper_World(world_room) constructor {
	
	blocks = [];
	water_level = 0;
	self.world_room = world_room;
	
	
	
	/// @func create_block(block, x, y)
	/// @desc Creates a specified block in the world
	/// @arg {thinker_miniscraper_Block} block The block to add, an thinker_miniscraper_Block instance representing the block to add
	/// @arg {real} x The x position to create the block at
	/// @arg {real} y The y position to create the block at
	static create_block = function(block, x, y) {
		var inst = instance_create_layer(
			x, y, thinker_miniscraper_layer_blocks,
			thinker_miniscraper_obj_block
		);
		inst.set_block(block);
		array_push(blocks, inst);
		
		var collision = instance_create_layer(
			x, y, thinker_miniscraper_layer_block_collision,
			thinker_miniscraper_obj_collision
		);
		collision.set_size(block.width, block.height);
		
		return inst;
	}
	
	/// @func get_blocks()
	/// @desc Gets an array of all blocks in the world
	static get_blocks = function() {
		var blocks_copy = [];
		array_copy(blocks_copy, 0, blocks, 0, get_blocks_count());
		return blocks_copy;
	}
	
	/// @func get_blocks_count()
	/// @desc Gets the amount of blocks in the world
	static get_blocks_count = function() {
		return array_length(blocks);
	}
	
	/// @func get_last_block()
	/// @desc Gets the block that was added most recently
	static get_last_block = function() {
		return blocks[get_blocks_count() - 1];
	}
	
	/// @func get_block_iterator()
	/// @desc Gets a thinker_ArrayIterator which iterates through the blocks in the world
	static get_block_iterator = function() {
		return new thinker_ArrayIterator(blocks);
	}
	
	/// @func get_highest_block_position()
	/// @desc Gets the y-position of the block with the highest y-position
	static get_highest_block_position = function() {
		var highest = infinity;
		var iterator = get_block_iterator();
		while (iterator.next()) {
			var current = iterator.get_current();
			var current_y = current.y;
			if (current_y < highest) highest = current_y;
		}
		return highest;
	}
	
	/// @func set_water_level(value)
	/// @desc Sets the water level to a percise value
	/// @arg {real} value The value to set the water level to
	static set_water_level = function(value) {
		water_level = max(0, value);
	}
	
	/// @func increase_water_level(amount)
	/// @desc Increases the water level by a specified amount
	/// @arg {real} amount The amount to increase the water level by, will be clamped to 0 if negative
	static increase_water_level = function(amount) {
		set_water_level(water_level + max(0, amount));
	}
	
	/// @func get_room()
	/// @desc Gets the room corresponding to the world
	static get_room = function() {
		return world_room;
	}
	
}
