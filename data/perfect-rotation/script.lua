function onCreate()
	makeLuaSprite('bg', 'stages/PERFECT ROTATION', 0, 0);
	scaleObject('bg', 0.666666666, 0.666666666);
	addLuaSprite('bg', false);
	setObjectCamera('bg', 'camHUD')
end
function onCreatePost()
	setProperty('camGame.visible', false)
	if not isRoomConnected() then
		setProperty('iconP2.visible', false)
	end
end
function onUpdate()
	if playAsBF() or not isRoomConnected() then
		setProperty('strumLineNotes.members[0].x', -10000)
		setProperty('strumLineNotes.members[1].x', -10000)
		setProperty('strumLineNotes.members[2].x', -10000)
		setProperty('strumLineNotes.members[3].x', -10000)

		if not middlescroll then
			setProperty('strumLineNotes.members[4].x', defaultPlayerStrumX0 - 318)
			setProperty('strumLineNotes.members[5].x', defaultPlayerStrumX1 - 318)
			setProperty('strumLineNotes.members[6].x', defaultPlayerStrumX2 - 318)
			setProperty('strumLineNotes.members[7].x', defaultPlayerStrumX3 - 318)
		end
	else
		setProperty('strumLineNotes.members[4].x', -10000)
		setProperty('strumLineNotes.members[5].x', -10000)
		setProperty('strumLineNotes.members[6].x', -10000)
		setProperty('strumLineNotes.members[7].x', -10000)

		if not middlescroll then
			setProperty('strumLineNotes.members[0].x', defaultPlayerStrumX0 - 318)
			setProperty('strumLineNotes.members[1].x', defaultPlayerStrumX1 - 318)
			setProperty('strumLineNotes.members[2].x', defaultPlayerStrumX2 - 318)
			setProperty('strumLineNotes.members[3].x', defaultPlayerStrumX3 - 318)
		end
	end
end