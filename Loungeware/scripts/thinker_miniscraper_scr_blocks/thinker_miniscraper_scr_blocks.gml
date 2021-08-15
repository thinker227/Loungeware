function thinker_miniscraper_Block(width, height, sprite) {
	self.width = width;
	self.height = height;
	self.sprite = sprite;
}

global.__thinker_miniscraper_blocks = [
	new thinker_miniscraper_Block(16, 16, thinker_miniscraper_spr_collision_debug)
];
