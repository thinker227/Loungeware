/// @func thinker_miniscraper_StateBuild()
/// @desc Main build state
function thinker_miniscraper_StateBuild() constructor {
	
	player_state = {
		collumn: 6,
	};
	
	static update = function() {
		if (KEY_LEFT_PRESSED) on_left_pressed();
		if (KEY_RIGHT_PRESSED) on_right_pressed();
		if (KEY_PRIMARY_PRESSED) on_primary_pressed();
	}
	
	static draw = function() {
		
	}
	
	static draw_dropshadow = function(x, y, width, height) {
		draw_sprite_stretched(
			thinker_miniscraper_spr_dropshadow, 0,
			x, y, width, height
		);
	}
	
	static on_left_pressed = function() {
		move_collumn(-1);
	}
	
	static on_right_pressed = function() {
		move_collumn(1);
	}
	
	static move_collumn = function(distance) {
		var new_collumn = player_state.collumn + distance;
		if (new_collumn < 0 || new_collumn >= thinker_miniscraper_collumn_count) {
			on_collumn_move_outside();
		} else {
			player_state.collumn = new_collumn;
		}
	}
	
	static on_collumn_move_outside = function() {
		
	}
	
	static on_primary_pressed = function() {
		
	}
	
}
