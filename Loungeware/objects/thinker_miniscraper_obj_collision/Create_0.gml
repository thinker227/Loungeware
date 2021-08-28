sprite = thinker_miniscraper_spr_collision_pixel;

width = 0;
height = 0;
debug_sprite_xscale = 0;
debug_sprite_yscale = 0;

/// @func set_size(width, height)
/// @desc Sets the width and height of the collision object
/// @arg {int} width The width of the collision object
/// @arg {int} height The height of the collision object
set_size = function(width, height) {
	self.width = width;
	self.height = height;
	
	image_xscale = width;
	image_yscale = height;
	
	debug_sprite_xscale = width / sprite_get_width(thinker_miniscraper_spr_collision_debug);
	debug_sprite_xscale = height / sprite_get_width(thinker_miniscraper_spr_collision_debug);
}

set_size(1, 1);
