function onCreate() 
	setProperty('cameraSpeed', 50)
	allowCountdown = true;


 	makeLuaSprite('sky', 'stages/yoshi island/sky', 200, 0);
	setScrollFactor('sky', 0.8, 0.8);
	scaleObject('sky', 1.1, 1.1);

	makeLuaSprite('ocean', 'stages/yoshi island/ocean', 300, 50 + 585.2);
	setScrollFactor('ocean', 0.9, 0.9);
	scaleObject('ocean', 1.2, 1.1);

	makeLuaSprite('floor', 'stages/yoshi island/floor', 400, 50);
	setScrollFactor('floor', 1.0, 1.0);
	scaleObject('floor', 1.1, 1.1);

	makeLuaSprite('fruit', 'stages/yoshi island/fruit', 400, 50 + 695.2);
	setScrollFactor('fruit', 0.9, 0.9);
	scaleObject('fruit', 1.1, 1.1);


	addLuaSprite('sky', false);
	addLuaSprite('ocean', false);
	addLuaSprite('floor', false);
	addLuaSprite('fruit', true);
end
function onCreatePost()
	cameraSetTarget('dad')
end
function onSongStart()
	setProperty('cameraSpeed', 1.2)
end