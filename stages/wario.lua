local oppDirection = 'left'
local oppCount = 0
local playerDirection = 'left'
local playerCount = 0
local missCount = 0

function onCreate() 
	precacheImage('characters/sticker-brent/left')
	precacheImage('characters/sticker-brent/down')
	precacheImage('characters/sticker-brent/up')
	precacheImage('characters/sticker-brent/right')

	precacheImage('characters/sticker-luigi/left')
	precacheImage('characters/sticker-luigi/down')
	precacheImage('characters/sticker-luigi/up')
	precacheImage('characters/sticker-luigi/right')

	precacheImage('characters/sticker-sophist/left')
	precacheImage('characters/sticker-sophist/down')
	precacheImage('characters/sticker-sophist/up')
	precacheImage('characters/sticker-sophist/right')
	precacheImage('characters/miss')

 	makeLuaSprite('back', 'stages/wario/bg', -600, -300)

	makeLuaSprite('stand', 'stages/wario/stand', -500, -250);
	scaleObject('stand', 0.6, 0.6);

	makeLuaSprite('sign', 'stages/wario/sign', -700, 450);
	scaleObject('sign', 1.0, 1.0);

	makeLuaSprite('roll', 'stages/wario/roll', 0, 0);
	scaleObject('roll', 1.15, 1.15);
	setProperty('roll.y', 360 - (getProperty('roll.height') / 2) + 30)

	addLuaSprite('back', false);
	addLuaSprite('stand', false);
	addLuaSprite('sign', true);
	addLuaSprite('roll', false);

	setObjectCamera('roll', 'camOverlay')

	makeAnimatedLuaSprite('car',"stages/wario/car", 0, 0)
	addAnimationByPrefix('car','anim', 'car crash', 24, false)
	scaleObject('car', 2, 2);
	setObjectCamera('car', 'camOverlay')
	addLuaSprite('car', false);
	setProperty('car.alpha', 0.00001)
end

function onCreatePost()
	setProperty('boyfriendGroup.visible', false)
	setProperty('dadGroup.visible', false)
	setProperty('dad2Group.visble', false)
	setProperty('dad3Group.visble', false)
end
function onUpdate()
	setProperty('strumLineNotes.members[0].alpha', 0.4)
	setProperty('strumLineNotes.members[1].alpha', 0.4)
	setProperty('strumLineNotes.members[2].alpha', 0.4)
	setProperty('strumLineNotes.members[3].alpha', 0.4)
end
function onEvent(n, v1, v2)
	if n == 'Triggers' then
		if v1 == 'car' then
			setProperty('car.alpha', 1)
			objectPlayAnimation('car', 'anim', true)
		end
		if v1 == 'car end' then
			doTweenAlpha('car', 'car', 0, 1.2)
		end
	end
end
function onTweenCompleted(tag)
	if tag == 'car' then
		removeLuaSprite('car', true)
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote and noteType == '' then
		if direction == 0 then playerDirection = 'left' end
		if direction == 1 then playerDirection = 'down' end
		if direction == 2 then playerDirection = 'up' end
		if direction == 3 then playerDirection = 'right' end

		makeLuaSprite('sophist'..playerCount, 'characters/sticker-sophist/'..playerDirection, 0, 0);
		if direction == 1 then
			scaleObject('sophist'..playerCount, 0.5, 0.5);
		else
			scaleObject('sophist'..playerCount, (0.5 * 0.512), (0.5 * 0.512));
		end
		if downscroll then
			setProperty('sophist'..playerCount..'.x', 1280 - getProperty('sophist'..playerCount..'.width'))
			setProperty('sophist'..playerCount..'.y', 0)
		else
			setProperty('sophist'..playerCount..'.x', 1280 - getProperty('sophist'..playerCount..'.width'))
			setProperty('sophist'..playerCount..'.y', 720 - getProperty('sophist'..playerCount..'.height'))
		end
		addLuaSprite('sophist'..playerCount, false);
		setObjectCamera('sophist'..playerCount, 'camOverlay')
		if direction == 1 then
			doTweenX('sophist'..playerCount..'b', 'sophist'..playerCount..'.scale', 0.4, 0.4)
			doTweenY('sophist'..playerCount..'c', 'sophist'..playerCount..'.scale', 0.4, 0.4)
		else
			doTweenX('sophist'..playerCount..'b', 'sophist'..playerCount..'.scale', (0.4 * 0.512), (0.4 * 0.512))
			doTweenY('sophist'..playerCount..'c', 'sophist'..playerCount..'.scale', (0.4 * 0.512), (0.4 * 0.512))
		end
		doTweenAlpha('sophist'..playerCount, 'sophist'..playerCount, 0, 2)
		playerCount = playerCount + 1
	end
end
function noteMiss(direction)
	makeLuaSprite('miss'..missCount, 'characters/miss', 0, 0);
	scaleObject('miss'..missCount, 0.5, 0.5);
	if downscroll then
		setProperty('miss'..missCount..'.x', 1280 - getProperty('miss'..missCount..'.width'))
		setProperty('miss'..missCount..'.y', 0)
	else
		setProperty('miss'..missCount..'.x', 1280 - getProperty('miss'..missCount..'.width'))
		setProperty('miss'..missCount..'.y', 720 - getProperty('miss'..missCount..'.height'))
	end
	addLuaSprite('miss'..missCount, false);
	setObjectCamera('miss'..missCount, 'camOverlay')
	doTweenX('miss'..missCount..'b', 'miss'..missCount..'.scale', 0.4, 0.4)
	doTweenY('miss'..missCount..'c', 'miss'..missCount..'.scale', 0.4, 0.4)
	doTweenAlpha('miss'..missCount, 'miss'..missCount, 0, 2)
	missCount = missCount + 1
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		if direction == 0 then oppDirection = 'left' end
		if direction == 1 then oppDirection = 'down' end
		if direction == 2 then oppDirection = 'up' end
		if direction == 3 then oppDirection = 'right' end

		if noteType == 'Dad2 Sing' then
			makeLuaSprite('brent'..oppCount, 'characters/sticker-luigi/'..oppDirection, 0, 0);
		else
			makeLuaSprite('brent'..oppCount, 'characters/sticker-brent/'..oppDirection, 0, 0);
		end
		scaleObject('brent'..oppCount, 0.5, 0.5);
		addLuaSprite('brent'..oppCount, false);
		setObjectCamera('brent'..oppCount, 'camOverlay')
		doTweenX('brent'..oppCount..'b', 'brent'..oppCount..'.scale', 0.4, 0.4)
		doTweenY('brent'..oppCount..'c', 'brent'..oppCount..'.scale', 0.4, 0.4)
		doTweenAlpha('brent'..oppCount, 'brent'..oppCount, 0, 2)
		oppCount = oppCount + 1
	end
end