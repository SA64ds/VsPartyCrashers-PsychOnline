local bgX = -400
local bgY = -300

local bg2scale = 0.8

function onCreate() 
	--bg
 	makeLuaSprite('ground', 'stages/horrorLand/ground', bgX, bgY);
	addLuaSprite('ground', false);

	--fg
 	makeLuaSprite('gate', 'stages/horrorLand/gate', bgX, bgY + 1099);
	addLuaSprite('gate', true);

 	makeLuaSprite('light', 'stages/horrorLand/light', bgX, bgY);
	addLuaSprite('light', true);

	--bg the sequal
 	makeLuaSprite('ground2', 'stages/horrorLand/ground2', bgX, bgY);
	addLuaSprite('ground2', false);

 	makeLuaSprite('ovcolor', 'stages/horrorLand/ovcolor', bgX, bgY);
	addLuaSprite('ovcolor', true);

	scaleObject('ground2', bg2scale, bg2scale)
	setProperty('ground2.alpha', 0.00001)

	--white fucking blob
 	makeLuaSprite('bgWhite', '', -10000, -5000)
    	makeGraphic('bgWhite', 1280, 720, 'ffffff') 	
	setScrollFactor('bgWhite', 0, 0);
	scaleObject('bgWhite', 100, 100);
	addLuaSprite('bgWhite', false);
	setProperty('bgWhite.alpha', 0.0001)

   	createInstance('boo', 'objects.Character', {700, -250, 'king-boo'})
    	addInstance('boo')
	setProperty('boo.alpha', 0.0001)

	--placements 
 	makeLuaSprite('placementV', 'stages/horrorLand/placementUI/vernias', 0, 0);
	scaleObject('placementV', 0.3, 0.3);
	setObjectCamera('placementV', 'camOverlay')
	addLuaSprite('placementV', true);

 	makeLuaSprite('placementS', 'stages/horrorLand/placementUI/sophist', 1280 - getProperty('placementV.width'), 0);
	scaleObject('placementS', 0.3, 0.3);
	setObjectCamera('placementS', 'camOverlay')
	addLuaSprite('placementS', true);

 	makeLuaSprite('placementN', 'stages/horrorLand/placementUI/nick', 0, 720 - getProperty('placementV.height'));
	scaleObject('placementN', 0.3, 0.3);
	setObjectCamera('placementN', 'camOverlay')
	addLuaSprite('placementN', true);

 	makeLuaSprite('placementB', 'stages/horrorLand/placementUI/brent', 1280 - getProperty('placementV.width'), 720 - getProperty('placementV.height'));
	scaleObject('placementB', 0.3, 0.3);
	setObjectCamera('placementB', 'camOverlay')
	addLuaSprite('placementB', true);

	setProperty('placementV.alpha', 0.00001)
	setProperty('placementS.alpha', 0.00001)
	setProperty('placementN.alpha', 0.00001)
	setProperty('placementB.alpha', 0.00001)
end