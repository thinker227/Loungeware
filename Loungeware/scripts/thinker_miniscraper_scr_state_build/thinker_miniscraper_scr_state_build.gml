/// @func thinker_miniscraper_StateBuild()
/// @desc Main build state
function thinker_miniscraper_StateBuild(world) constructor {
	
	self.world = world;
	// The current build state
	player_state = {
		column: 6,
		selected_block_index: 0,
	};
	
	
	
	/// @func update()
	/// @desc Updates the state
	static update = function() {
		if (KEY_LEFT_PRESSED) on_left_pressed();
		if (KEY_RIGHT_PRESSED) on_right_pressed();
		if (KEY_UP_PRESSED) on_up_pressed();
		if (KEY_DOWN_PRESSED) on_down_pressed();
		if (KEY_PRIMARY_PRESSED) on_primary_pressed();
	}
	
	/// @func draw()
	/// @desc Draws the state
	static draw = function() {
		
	}
	
	/// @func draw_dropshadow(x, y, width, height)
	/// @desc Draws a dropshadow at a specified position
	/// @arg {real} x The x position to draw the dropshadow at.
	/// @arg {real} y The y position to draw the dropshadow at.
	/// @arg {real} width The width of the dropshadow.
	/// @arg {real} height The height of the dropshadow.
	static draw_dropshadow = function(x, y, width, height) {
		draw_sprite_stretched(
			thinker_miniscraper_spr_dropshadow, 0,
			x, y, width, height
		);
	}
	
	/// @func on_left_pressed()
	/// @desc Function called when a left input is recieved
	static on_left_pressed = function() {
		move_column(-1);
	}
	
	/// @func on_right_pressed()
	/// @desc Function called when a right input is recieved
	static on_right_pressed = function() {
		move_column(1);
	}
	
	/// @func move_column(distance)
	/// @desc Moves the current column by a specified distance
	/// @arg {int} distance The distance to move the current column
	static move_column = function(distance) {
		var new_column = player_state.column + distance;
		if (new_column < 0 || new_column >= thinker_miniscraper_column_count) {
			on_column_move_outside();
		} else {
			player_state.column = new_column;
		}
	}
	
	/// @func on_column_move_outside()
	/// @desc Function called when the column attempts to go outside its bounds
	static on_column_move_outside = function() {
		
	}
		
	/// @func on_up_pressed()
	/// @desc Function called when an up input is recieved
	static on_up_pressed = function() {
		change_selected_block_index(1);
	}
	
	/// @func on_down_pressed()
	/// @desc Function called when a down input is recieved
	static on_down_pressed = function() {
		change_selected_block_index(-1);
	}
	
	/// @func change_selected_block_index(distance)
	/// @desc Changes the index of the currently selected block by a specified distance
	/// @arg {int} distance The distance to change the index by
	static change_selected_block_index = function(distance) {
		var block_count = array_length(thinker_miniscraper_blocks);
		var new_index = player_state.selected_block_index + distance;
		
		if (new_index < 0) new_index = block_count - 1;
		if (new_index >= block_count) new_index = 0;
		
		player_state.selected_block_index = new_index;
	}
	
	/// @func on_primary_pressed()
	/// @desc Function called when a primary input is recieved
	static on_primary_pressed = function() {
		create_block();
	}
	
	/// @func get_selected_block()
	/// @desc Gets the current selected block based on the current selected index
	static get_selected_block = function() {
		return thinker_miniscraper_blocks[player_state.selected_block_index];
	}
	
	/// @func get_drop_y(drop_x, block)
	/// @desc Gets the y position to drop a block at based on a specified x position and the block to drop
	/// @arg {real} drop_x The x position to drop the block at
	/// @arg {thinker_miniscraper_Block} block The block to drop
	static get_drop_y = function(drop_x, block) {
		
	}
	
	/// @func create_block()
	/// @desc Creates a block based on the current player state
	static create_block = function() {
		var selected_block = get_selected_block();
		var drop_x = player_state.column * thinker_miniscraper_grid_size;
		var drop_y = get_drop_y(drop_x, selected_block);
		world.create_block(selected_block, drop_x, drop_y);
	}
	
}
