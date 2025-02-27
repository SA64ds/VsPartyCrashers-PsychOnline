local dadX = 0
local dadY = 0

function onCreate() 
 	makeLuaSprite('back', 'stages/electrical/Electrical', 400, 50);
	setScrollFactor('back', 1.0, 1.0);
	scaleObject('back', 1.1, 1.1);

	makeLuaSprite('top', 'stages/electrical/wires_top', 500, 50);
	setScrollFactor('top', 1.2, 1);
	scaleObject('top', 1.15, 1.15);

	addLuaSprite('back', false);
	addLuaSprite('floor', false);
	addLuaSprite('top', true);
end
function onCreatePost()
	setProperty('camGame.visible', false)
	setProperty('camZooming', true)
	setProperty('strumLineNotes.visible', false)
	setProperty('uiGroup.visible', false)

	dadX = getProperty('dadGroup.x')
	dadY = getProperty('dadGroup.y')

	setObjectOrder('dadGroup', getObjectOrder('back') + 1)
	setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 1)
	setObjectOrder('boyfriendGroup', getObjectOrder('gfGroup') + 1)
	setObjectOrder('top', getObjectOrder('boyfriendGroup') + 1)

	setProperty('gf.alpha', 0.0001)
	setProperty('dadGroup.y', 250)
end
function onEvent(n,v1, v2)
	if n == 'Triggers' then
		if v1 == 'cam appear' then
			setProperty('strumLineNotes.visible', true)
			setProperty('uiGroup.visible', true)
			setProperty('camGame.visible', true)
			setProperty('botplayTxt.visible', false)
			setProperty('camHUD.visible', true)
			setProperty('defaultCamZoom', 0.85)
		end
		if v1 == 'cam off' then
			setProperty('camHUD.visible', false)
			setProperty('camGame.visible', false)
		end
		if v1 == 'black' then
			setProperty('dadGroup.x', dadX + 100)
			setProperty('dadGroup.y', dadY)
			setProperty('gf.alpha', 1)
		end
		if v1 == 'end' then
			setProperty('dad.debugMode', true)
			doTweenAlpha('gf', 'gf', 0.2, 0.8)
		end
	end
end