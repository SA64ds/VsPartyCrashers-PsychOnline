function onCreate() 
 	makeLuaSprite('back', 'stages/tutorial/bg', 0, 50);
	makeLuaSprite('chair', 'stages/tutorial/chairs', 0, 50);
	makeLuaSprite('circle', 'stages/tutorial/shadow', 625, 900);
	setProperty('circle.alpha', 0.2)

    	makeLuaSprite('ball', 'stages/tutorial/ball', 30, 875);
	scaleObject('ball', 1.1, 1.1);

	makeLuaSprite('ball sh', 'stages/tutorial/shadow2', 10, 980);
	scaleObject('ball sh', 1.1, 1.1);
	setProperty('ball sh.alpha', 0.2)

	makeLuaSprite('sp', 'stages/tutorial/shadow3', 200, 1250);
	setProperty('sp.alpha', 0.2)
	setProperty('sp.color', 0x0000000)	

	addLuaSprite('back', false);
    	addLuaSprite('circle', false);
    	addLuaSprite('sp', false);
	addLuaSprite('chair', false);
    	addLuaSprite('ball sh', false);
    	addLuaSprite('ball', false);
end