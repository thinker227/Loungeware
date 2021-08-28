/// @func thinker_miniscraper_Block(width, height, sprite)
/// @desc Represents information about a block
/// @arg {int} width The width of the block
/// @arg {int} height The height of the block
/// @arg {sprite} sprite The sprite of the block
function thinker_miniscraper_Block(width, height, sprite) constructor {
	self.width = width;
	self.height = height;
	self.sprite = sprite;
}

/// @func thinker_miniscraper_block_default()
/// @desc Returns a default thinker_miniscraper_Block instance
function thinker_miniscraper_block_default() {
	return new thinker_miniscraper_Block(
		16, 16,
		thinker_miniscraper_spr_collision_debug
	);
}

global.__thinker_miniscraper_blocks = [
	new thinker_miniscraper_Block(16, 16, thinker_miniscraper_spr_collision_debug)
];
