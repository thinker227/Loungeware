/// @func thinker_miniscraper_StateBuild()
/// @desc Main build state
function thinker_miniscraper_StateBuild() constructor {
	
	static building_types = {
		
	};
	
	player_state = {
		drop_collumn: 6,
	};
	
	static update = function() {
		if (KEY_LEFT_PRESSED) left_press();
		if (KEY_RIGHT_PRESSED) right_press();
		if (KEY_PRIMARY_PRESSED) primary_press();
	}
	
	static draw = function() {
		
	}
	
	static left_press = function() {
		
	}
	
	static right_press = function() {
		
	}
	
	static primary_press = function() {
		
	}
	
}
