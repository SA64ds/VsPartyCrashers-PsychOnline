function onCreate() 
 	makeLuaSprite('back', 'stages/chomp/Wall Graf', 400, 50);
	scaleObject('back', 1.2, 1.2);

	makeLuaSprite('floor', 'stages/chomp/Floor Poison', 400, 50 + (419 * 1.2));
	scaleObject('floor', 1.2, 1.2);


	makeLuaSprite('top', 'stages/chomp/Fore Poison', 200, 50 + (845 * 1.2));
	scaleObject('top', 1.25, 1.25);

	makeLuaSprite('dark', 'stages/chomp/Dark Poison', 200, 50);
	scaleObject('dark', 1.25, 1.25);
   	setProperty('dark.alpha', 0.25)

	makeLuaSprite('light', 'stages/chomp/Light Poison', 200 + (299 * 1.2), 50);
	scaleObject('light', 1.25, 1.25);
	setProperty('light.alpha', 0.06)

	addLuaSprite('back', false);
	addLuaSprite('floor', false);
	addLuaSprite('top', true);
	addLuaSprite('dark', true);
	addLuaSprite('light', true);
end
function onEvent(n, v1, v2)
	if n == 'Triggers' and v1 == 'end' then
		setProperty('camGame.visible', false)
	end
end