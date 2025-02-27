
local bgX = -1803
local bgY = -1687

function onCreate()
	setProperty('camZooming', true)

	if songName == 'Toxic' then
		setProperty('cameraSpeed', 50)
		setProperty('camGame.zoom', 1)
		setProperty('defaultCamZoom', 1)
	end

 	makeLuaSprite('sky', 'stages/birthdaycake/sky', bgX, bgY);
	scaleObject('sky', 0.7, 0.7);
	setLuaSpriteScrollFactor('sky', 0.7, 0.7);
	addLuaSprite('sky', false);

 	makeLuaSprite('table', 'stages/birthdaycake/table', bgX, bgY + (560 * 0.7));
	scaleObject('table', 0.7, 0.7);
	setLuaSpriteScrollFactor('table', 0.85, 0.85);
	addLuaSprite('table', false);

 	makeLuaSprite('ground', 'stages/birthdaycake/ground', bgX, bgY + (509 * 0.7));
	scaleObject('ground', 0.7, 0.7);
	setLuaSpriteScrollFactor('ground', 1, 1);
	addLuaSprite('ground', false);

 	makeLuaSprite('fg', 'stages/birthdaycake/cream_fg', bgX + (2516 * 0.7), bgY + (2493 * 0.7));
	scaleObject('fg', 0.7, 0.7);
	setLuaSpriteScrollFactor('fg', 1.1, 1);
	addLuaSprite('fg', true);

 	makeLuaSprite('black3', '', -50, -50)
    	makeGraphic('black3', 3000, 1500, '000000') 	
	setObjectCamera('black3','camOverlay')
	addLuaSprite('black3',false)
	setProperty('black3.alpha', 0)
end
function onEvent(n, v1)
	if n == 'Triggers' and v1 == 'end' then
		doTweenAlpha('black', 'black3', 1, 1.3, 'quadInOut')
	end
end