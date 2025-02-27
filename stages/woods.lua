local bgX = -600
local bgY = -400
local ending = false
local sin = math.sin
local floor = math.floor
local tau = math.pi * 2 -- thanks ovo and cyn0X8 ^v^
local booY = 0

function onCreate() 
	setProperty('cameraSpeed', 50)
	allowCountdown = true;

	makeLuaSprite('bg', 'stages/woods/Woody Woods King of Skill', bgX, bgY);
	scaleObject('bg', 1.4, 1.4);
	addLuaSprite('bg', false);

	makeLuaSprite('space', 'stages/woods/Blue Space', bgX + 350, bgY + 1200);
	scaleObject('space', 1.3, 1.3);
	addLuaSprite('space', false);

	makeLuaSprite('space3', 'stages/woods/Blue Space', getProperty('space.x') + 1450, bgY + 1200);
	scaleObject('space3', 1.3, 1.3);
	addLuaSprite('space3', false);

	makeLuaSprite('space4', 'stages/woods/Blue Space', getProperty('space.x') - 750, bgY + 1200);
	scaleObject('space4', 1.3, 1.3);
	addLuaSprite('space4', false);

	makeAnimatedLuaSprite('fuckassBoo',"stages/woods/boo", 500, 0)
	addAnimationByPrefix('fuckassBoo','anim', 'boo Idle', 12, false)
	scaleObject('fuckassBoo', 0.5, 0.5);
	addLuaSprite('fuckassBoo', false);
end
function onCreatePost()
	cameraSetTarget('dad')
end
function onSongStart()
	setProperty('cameraSpeed', 1.2)
end
function onBeatHit()
	if curBeat % 4 == 0 then
		objectPlayAnimation('fuckassBoo', 'anim', true)
		setProperty('fuckassBoo.y', booY + 10)	
		doTweenY('boop', 'fuckassBoo', booY, 0.35)
	end
end
function onUpdate(elapsed)
	--thingy = sin((getSongPosition() / 1000) * (curBpm / 60))
	--setProperty('fuckassBoo.y', thingy)
end
function onSectionHit()
	if not ending then
		if mustHitSection then
			setProperty('fuckassBoo.flipX', true)
		else
			setProperty('fuckassBoo.flipX', false)
		end
	end
end
function onEvent(n, v1, v2)
	if n == 'Triggers' then
		if v1 == 'black' then
			setProperty('camGame.visible', false)
		end
		if v1 == 'grey' then
			setProperty('camGame.visible', true)
			initLuaShader("adjustColor");
			setColorShader('bg', 0, -100, 0, 0)
			setColorShader('space', 0, -100, 0, 0)
			setColorShader('space3', 0, -100, 0, 0)
			setColorShader('space4', 0, -100, 0, 0)
			setColorShader('fuckassBoo', 0, -100, 0, 0)
			setColorShader('dad', 0, -100, 0, 0)
			setColorShader('gf', 0, -100, 0, 0)
			setColorShader('boyfriend', 0, -100, 0, 0)
			setColorShader('healthBar.leftBar', 0, -100, 0, 0)
			setColorShader('healthBar.rightBar', 0, -100, 0, 0)
			setColorShader('iconP2', 0, -100, 0, 0)
			setColorShader('iconP1', 0, -100, 0, 0)
		end
		if v1 == 'grey end' then
			removeSpriteShader('bg')
			removeSpriteShader('space')
			removeSpriteShader('space3')
			removeSpriteShader('space4')
			removeSpriteShader('dad')
			removeSpriteShader('gf')
			removeSpriteShader('fuckassBoo')
			removeSpriteShader('boyfriend')
			removeSpriteShader('healthBar.leftBar')
			removeSpriteShader('healthBar.rightBar')
			removeSpriteShader('iconP2')
			removeSpriteShader('iconP1')
		end
		if v1 == 'boo' then
			ending = true
			setProperty('fuckassBoo.flipX', false)

			setProperty('fuckassBoo.x', getProperty('boyfriend.x') + 250)
			setProperty('fuckassBoo.y', getProperty('boyfriend.y') - 250)
			booY = getProperty('fuckassBoo.y')
		end
	end
end
--[1] = hue, [2] = saturation, [3] = contrast, [4] == brightness
function setColorShader(obj, val1, val2, val3, val4)
	setSpriteShader(obj, 'adjustColor')
	setShaderFloat(obj, 'hue', val1)
	setShaderFloat(obj, 'saturation', val2)
	setShaderFloat(obj, 'contrast', val3)
	setShaderFloat(obj, 'brightness', val4)
end