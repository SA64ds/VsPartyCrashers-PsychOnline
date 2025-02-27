
local scale = 3
function onCreate()
 	makeLuaSprite('space', 'stages/spaceland/space', -1803, -1687);
	scaleObject('space', 0.95, 0.95);
	setLuaSpriteScrollFactor('space', 0.8, 0.8);
	addLuaSprite('space', false);

 	makeLuaSprite('platform', 'stages/spaceland/platform', getProperty('space.x') + (105 * 0.95), getProperty('space.y') + (1645 * 0.95));
	scaleObject('platform', 0.95, 0.95);
	setLuaSpriteScrollFactor('platform', 1, 1);
	addLuaSprite('platform', false);

 	makeLuaSprite('objs2', 'stages/spaceland/objs2', getProperty('space.x') + (1700 * 0.95), getProperty('space.y') + (545 * 0.95));
	scaleObject('objs2', 0.95, 0.95);
	setLuaSpriteScrollFactor('objs2', 1, 1);
	addLuaSprite('objs2', false);

 	makeLuaSprite('backrail', 'stages/spaceland/backrail', getProperty('space.x'), getProperty('space.y') + (1870 * 0.95));
	scaleObject('backrail', 0.95, 0.95);
	setLuaSpriteScrollFactor('backrail', 1, 1);
	addLuaSprite('backrail', false);

 	makeLuaSprite('objs', 'stages/spaceland/objs', getProperty('space.x') + (1349 * 0.95), getProperty('space.y') + (1343 * 0.95));
	scaleObject('objs', 0.95, 0.95);
	setLuaSpriteScrollFactor('objs', 1, 1);
	addLuaSprite('objs', false);

 	makeLuaSprite('rail', 'stages/spaceland/rail', getProperty('space.x') + (65 * 0.95), getProperty('space.y')+ (1780 * 0.95));
	scaleObject('rail', 0.95, 0.95);
	setLuaSpriteScrollFactor('rail', 1, 1);
	addLuaSprite('rail', false);

 	makeLuaSprite('rail2', 'stages/spaceland/rail2', getProperty('space.x'), getProperty('space.y') + (2104 * 0.95));
	scaleObject('rail2', 0.95, 0.95);
	setLuaSpriteScrollFactor('rail2', 1, 1);
	addLuaSprite('rail2', false);

 	makeLuaSprite('num', 'stages/spaceland/one', getProperty('space.x'), getProperty('space.y'));
	scaleObject('num', 0.95, 0.95);
	setLuaSpriteScrollFactor('num', 1, 1);
	addLuaSprite('num', false);

 	makeLuaSprite('rail3', 'stages/spaceland/rail3', getProperty('space.x'), getProperty('space.y') + (2799 * 0.95));
	scaleObject('rail3', 0.95, 0.95);
	setLuaSpriteScrollFactor('rail3', 1, 1);
	addLuaSprite('rail3', false);

 	makeLuaSprite('lights', 'stages/spaceland/lights', getProperty('space.x') + (1454 * 0.95), getProperty('space.y') + (2002 * 0.95));
	scaleObject('lights', 0.95, 0.95);
	setLuaSpriteScrollFactor('lights', 1, 1);
	addLuaSprite('lights', false);

 	makeLuaSprite('fg', 'stages/spaceland/fg', getProperty('space.x'), getProperty('space.y') + (2398 * 0.95));
	scaleObject('fg', 0.95, 0.95);
	setLuaSpriteScrollFactor('fg', 1.3, 1);
	addLuaSprite('fg', true);

 	makeLuaSprite('black3', '', -50, -50)
    	makeGraphic('black3', 3000, 1500, '000000') 	
	setObjectCamera('black3','camOverlay')
	addLuaSprite('black3',false)
	setProperty('black3.alpha', 0)
end
function onCreatePost()
	if songName == 'Cursed Die' then
		setProperty('gfGroup.visible', false)
	end
end
function onEvent(n, v1)
	if n == 'Triggers' and v1 == 'end' then
		doTweenAlpha('black', 'black3', 1, 1.3, 'quadInOut')
	end
end