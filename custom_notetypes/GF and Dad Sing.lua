function onCreate()
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'GF and Dad Sing' then
		if direction == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'gf')
		end
		if direction == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'gf')
		end
		if direction == 2 then
			triggerEvent('Play Animation', 'singUP', 'gf')
		end
		if direction == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'gf')
		end
	end
end