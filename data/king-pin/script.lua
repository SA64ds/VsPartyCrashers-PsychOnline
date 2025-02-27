function onCreatePost()
 	makeLuaSprite('black3', '', -50, -50)
    	makeGraphic('black3', 3000, 1500, '000000') 	
	setObjectCamera('black3','camOverlay')
	addLuaSprite('black3',false)
	setProperty('black3.alpha', 0)
end
function onEvent(n, v1, v2)
	if n == 'Triggers' then
		if v1 == 'move' then
			doTweenX('move', 'dadGroup', getProperty('dadGroup.x') + 260, 0.7, 'quadInOut')
			doTweenX('move2', 'boyfriendGroup', getProperty('boyfriendGroup.x') - 260, 0.7, 'quadInOut')
		end	
		if v1 == 'matt' then
			setObjectOrder('boyfriendGroup', getObjectOrder('gfGroup') + 1)
			setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1)
		end
		if v1 == 'brent' then
			setObjectOrder('dadGroup', getObjectOrder('gfGroup') + 1)
			setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup') + 1)
		end
		if v1 == 'cam freeze' then
			setProperty('isCameraOnForcedPos', true)
			setProperty('dad.debugMode', true)
			setProperty('boyfriend.debugMode', true)
		end
		if v1 == 'k o' then
			doTweenX('move2', 'boyfriendGroup', getProperty('boyfriendGroup.x') - 100, 0.1, 'quadInOut')
			doTweenY('ko', 'dad', -1000, 0.2)
		end
		if v1 == 'end' then
			setProperty('boyfriend.debugMode', false)
			doTweenAlpha('ye', 'black3', 1, 3)
			doTweenAlpha('ye2', 'camHUD', 0, 3)
		end
	end
end