
local dadY = 0
local dadScale = 1
local booCanDance = false

function onCreatePost()
	setProperty('dad2.alpha', 0.0001)
	setProperty('dad3.alpha', 0.0001)
	setProperty('dad4.alpha', 0.0001)
	setObjectCamera('dad2Group', 'camOverlay')
	setObjectCamera('dad3Group', 'camOverlay')
	setObjectCamera('dad4Group', 'camOverlay')

 	makeLuaSprite('mic', 'stages/horrorLand/mic', getProperty('boyfriend.x') - 120, getProperty('boyfriend.y') + 150);
	addLuaSprite('mic', true);
	scaleObject('mic', 0.85, 0.85)
	setProperty('mic.alpha', 0.0001)

	makeAnimatedLuaSprite('block',"stages/horrorLand/Warp Block", getProperty('dad.x') - 100, getProperty('dad.y') - 600)
	addAnimationByIndices('block','anim', 'Warping Time', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44', 24, false);
	addAnimationByIndices('block','anim2', 'Warping Time', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75', 24, false);
	addAnimationByIndices('block','anim3', 'Warping Time', '76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96', 24, false);
	addLuaSprite('block', true);
	setProperty('block.alpha', 0.0001)

 	makeLuaSprite('black3', '', -50, -50)
    	makeGraphic('black3', 3000, 1500, '000000') 	
	setObjectCamera('black3','camOverlay')
	addLuaSprite('black3',true)
	setProperty('black3.alpha', 0)
end
function onEvent(n, v1, v2)
	if n == 'Triggers' then	
		if v1 == 'boo' then
			if v2 == 'enable idle' then
				booCanDance = true
			else
				booCanDance = false
				if v2 == 'enterance' then
					doTweenAlpha('boo', 'boo', 1, 0.4)
				end
				playAnim('boo', v2, true)
			end
		end
		if v1 == 'block' then
			objectPlayAnimation('block', 'anim')
			setProperty('block.alpha', 1)
		end
		if v1 == 'block2' then
			objectPlayAnimation('block', 'anim2')
			runTimer('block', 0.15)
		end
		if v1 == 'block3' then
			objectPlayAnimation('block', 'anim3')	
		end
		if v1 == 'block3b' then
			dadY = getProperty('dad.y')
			dadScale = getProperty('dad.scale.y')
			setProperty('dad.alpha', 1)
			setProperty('dad.scale.y', (dadScale * 0.1))
			setProperty('dad.y', getProperty('dad.y') - 400)
			doTweenY('squz3', 'dad', dadY, 0.2)
			doTweenY('squz4', 'dad.scale', dadScale, 0.2)
		end
		if v1 == 'block4' then
			setProperty('block.alpha', 0.0001)
		end
		if v1 == 'fix' then
			setProperty('dad.alpha', 1)
			setProperty('dad.scale.y', dadScale)
		end
		if v1 == 'kiss' then
   			if getProperty("healthBar.percent") < 20 then
      				setProperty("health", getProperty("health") + 1)
      				triggerEvent('Play Animation', 'heal', 'gf')
   		 	end  
		end
		if v1 == 'end' then
			doTweenAlpha('black', 'black3', 1, 1.3, 'quadInOut')
		end
		if v1 == 'black out' then
			setProperty('camGame.visible', false)
		end
		if v1 == 'mic' then
			setProperty('mic.alpha', 1)
			scaleObject('mic', 1.2, 1)
			setProperty('mic.x', getProperty('boyfriend.x') - 120)
			setProperty('mic.y', getProperty('boyfriend.y') + 150)
			doTweenX('micStart', 'mic', getProperty('dad.x') + 120, 0.35, 'quartInOut')
			doTweenY('mic2', 'mic', getProperty('dad.y') - 200, 0.35, 'quartInOut')
		end
		if v1 == 'mic miss' then 
			setProperty('mic.alpha', 1)
			scaleObject('mic', 1.2, 1)
			setProperty('mic.x', getProperty('boyfriend.x') - 120)
			setProperty('mic.y', getProperty('boyfriend.y') + 150)
			doTweenX('mic', 'mic', getProperty('dad.x') - 820, 0.75, 'quartInOut')
			doTweenY('mic2', 'mic', getProperty('dad.y') - 300, 0.75, 'quartInOut')
		end
		if v1 == 'mic2' then
			setProperty('mic.alpha', 1)
			scaleObject('mic', 1.2, 1)
			setProperty('mic.x', getProperty('boyfriend.x') - 120)
			setProperty('mic.y', getProperty('boyfriend.y') - 250)
			doTweenX('mic', 'mic', getProperty('dad.x') + 460, 0.3, 'quartInOut')
			doTweenY('mic2', 'mic', getProperty('dad.y') + 400, 0.3, 'quartInOut')
		end
		if v1 == 'mic3' then
			setProperty('mic.alpha', 1)
			scaleObject('mic', 1.2, 1)
			setProperty('mic.x', getProperty('boyfriend.x') - 120)
			setProperty('mic.y', getProperty('boyfriend.y') + 150)
			doTweenX('mic', 'mic', getProperty('dad.x') + 220, 0.3)
			doTweenY('mic2', 'mic', getProperty('dad.y') + 300, 0.3)
		end
		if v1 == 'mic4' then
			setProperty('mic.alpha', 1)
			scaleObject('mic', 1.2, 1)
			setProperty('mic.x', getProperty('boyfriend.x') - 120)
			setProperty('mic.y', getProperty('boyfriend.y') + 150)
			doTweenX('mic', 'mic', getProperty('dad.x') + 220, 0.3)
			doTweenY('mic2', 'mic', getProperty('dad.y') + 300, 0.3)
		end
		if v1 == 'all together now' then
			setProperty('camGame.visible', true)

			setProperty('placementV.alpha', 1)
			setProperty('placementS.alpha', 1)
			setProperty('placementN.alpha', 1)
			setProperty('placementB.alpha', 1)
			setProperty('ground2.alpha', 1)
			setProperty('dad.alpha', 1)

			setProperty('gate.alpha', 0)
			setProperty('light.alpha', 0)
			setProperty('ground.alpha', 0)

			setProperty('defaultCamZoom', 0.6)

			setProperty('boyfriend.x', getProperty('boyfriend.x') - 1500)
			setProperty('boyfriend.y', getProperty('boyfriend.y') - 250)
			setProperty('gf.x', getProperty('gf.x') - 1200)
			setProperty('gf.y', getProperty('gf.y') - 340)

			--vernias
			setObjectCamera('dadGroup', 'camOverlay')
			scaleObject('dadGroup', 0.2, 0.2)
			setProperty('dad.x', getProperty('placementV.x') + 2.5)
			setProperty('dad.y', getProperty('placementV.y') + 27.5)

			--sophist
			setProperty('dad4.alpha', 1)
			scaleObject('dad4Group', 0.2, 0.2)
			setProperty('dad4.x', getProperty('placementS.x') + 17.5)
			setProperty('dad4.y', getProperty('placementS.y') + 27.5)

			--nick
			setProperty('dad2.alpha', 1)
			scaleObject('dad2Group', 0.2, 0.2)
			setProperty('dad2.x', getProperty('placementN.x') + 2.5)
			setProperty('dad2.y', getProperty('placementN.y') + 67.5)

			--brent
			setProperty('dad3.alpha', 1)
			scaleObject('dad3Group', 0.2, 0.2)
			setProperty('dad3.x', getProperty('placementB.x') + 17.5)
			setProperty('dad3.y', getProperty('placementB.y') + 67.5)

			if not middlescroll then
				setProperty('strumLineNotes.members[4].x', defaultPlayerStrumX0 - 318)
				setProperty('strumLineNotes.members[5].x', defaultPlayerStrumX1 - 318)
				setProperty('strumLineNotes.members[6].x', defaultPlayerStrumX2 - 318)
				setProperty('strumLineNotes.members[7].x', defaultPlayerStrumX3 - 318)
			end
			setProperty('strumLineNotes.members[0].x', getProperty('strumLineNotes.members[4].x'))
			setProperty('strumLineNotes.members[1].x', getProperty('strumLineNotes.members[5].x'))
			setProperty('strumLineNotes.members[2].x', getProperty('strumLineNotes.members[6].x'))
			setProperty('strumLineNotes.members[3].x', getProperty('strumLineNotes.members[7].x'))

			setProperty('strumLineNotes.members[0].alpha', 0.1)
			setProperty('strumLineNotes.members[1].alpha', 0.1)
			setProperty('strumLineNotes.members[2].alpha', 0.1)
			setProperty('strumLineNotes.members[3].alpha', 0.1)
		end
		if v1 == 'silo' then
			initLuaShader("silhouette");
			setSpriteShader("boyfriend", "silhouette");
			setSpriteShader("dad", "silhouette");
			setSpriteShader("gf", "silhouette");
			setShaderFloatArray('boyfriend', 'col', {49 / 255, 176 / 255, 209 / 255})
			setShaderFloat('boyfriend', 'amount', 1)
			setShaderFloatArray('dad', 'col', {253 / 255, 183 / 255, 58 / 255})
			setShaderFloat('dad', 'amount', 1)
			setShaderFloatArray('gf', 'col', {165 / 255, 0 / 255, 77 / 255})
			setShaderFloat('gf', 'amount', 1)

			setProperty('bgWhite.alpha', 1)
			setProperty('gate.alpha', 0)
			setProperty('ovcolor.alpha', 0)
			setProperty('light.alpha', 0)
		end
		if v1 == 'silo end' then
			removeSpriteShader("boyfriend");
			removeSpriteShader("dad");
			removeSpriteShader("gf");

			setProperty('bgWhite.alpha', 0)
			setProperty('gate.alpha', 1)
			setProperty('ovcolor.alpha', 1)
			setProperty('light.alpha', 1)
		end
	end
end
function onBeatHit()
	if curBeat % 4 == 0 then
		if booCanDance then
			objectPlayAnimation('boo', 'idle', true)
		end
	end
end
function onTweenCompleted(tag)
	if tag == 'mic' or tag == 'micEnd' then
		setProperty('mic.alpha', 0.0001)
	end
	if tag == 'squz' then
		setProperty('dad.alpha', 0.0001)
	end
	if tag == 'micStart' then
		doTweenX('micEnd', 'mic', getProperty('dad.x') + 320, 0.1, 'quartInOut')
		doTweenY('micEnd2', 'mic', getProperty('dad.y') + 200, 0.1, 'quartInOut')
	end
end
function onTimerCompleted(tag)
	if tag == 'block' then
		doTweenY('squz', 'dad', getProperty('dad.y') - 400, 0.15)
		doTweenY('squz2', 'dad.scale', getProperty('dad.scale.x') * 0.1, 0.15)
	end
end