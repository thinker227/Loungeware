function thinker_miniscraper_Block(width, height, sprite) constructor {
	self.width = width;
	self.height = height;
	self.sprite = sprite;
}

function thinker_miniscraper_block_default() {
	return new thinker_miniscraper_Block(
		16, 16,
		thinker_miniscraper_spr_collision_debug
	);
}

global.__thinker_miniscraper_blocks = [
	new thinker_miniscraper_Block(16, 16, thinker_miniscraper_spr_collision_debug)
];
