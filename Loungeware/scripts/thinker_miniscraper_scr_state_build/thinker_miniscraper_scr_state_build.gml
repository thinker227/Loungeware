/// @func thinker_miniscraper_StateBuild()
/// @desc Main build state
function thinker_miniscraper_StateBuild() constructor {
	
	// The current build state
	player_state = {
		collumn: 6,
	};
	
	
	
	/// @func update()
	/// @desc Updates the state
	static update = function() {
		if (KEY_LEFT_PRESSED) on_left_pressed();
		if (KEY_RIGHT_PRESSED) on_right_pressed();
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
		move_collumn(-1);
	}
	
	/// @func on_right_pressed()
	/// @desc Function called when a right input is recieved
	static on_right_pressed = function() {
		move_collumn(1);
	}
	
	/// @func move_collumn(distance)
	/// @desc Moves the current collumn by a specified distance
	/// @arg {int} distance The distance to move the current collumn
	static move_collumn = function(distance) {
		var new_collumn = player_state.collumn + distance;
		if (new_collumn < 0 || new_collumn >= thinker_miniscraper_collumn_count) {
			on_collumn_move_outside();
		} else {
			player_state.collumn = new_collumn;
		}
	}
	
	/// @func on_collumn_move_outside()
	/// @desc Function called when the collumn attempts to go outside its bounds
	static on_collumn_move_outside = function() {
		
	}
	
	/// @func on_primary_pressed()
	/// @desc Function called when a primary input is recieved
	static on_primary_pressed = function() {
		
	}
	
}
