function onCreate() 
 	makeLuaSprite('back', 'stages/ring/bg', 400, 50);
	makeLuaSprite('stand', 'stages/ring/Wii Stage', 400, 50 + (450 * 1.2));
	makeLuaSprite('sign', 'stages/ring/miis', 400 + (50 * 1.2), 50 + (500 * 1.2));
	scaleObject('back', 1.2, 1.2)
	scaleObject('stand', 1.2, 1.2)
	scaleObject('sign', 1.2, 1.2)

	addLuaSprite('back', false);
    	addLuaSprite('sign', false);
	addLuaSprite('stand', false);
end