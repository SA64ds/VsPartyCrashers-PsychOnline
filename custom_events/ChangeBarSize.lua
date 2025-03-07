function onCreate()
    local height = 420
    makeLuaSprite('TopBar', nil, 0, -height)
	makeGraphic('TopBar', 1280, height, '000000')
	setObjectCamera('TopBar', 'camHUD')
	addLuaSprite('TopBar', true)

    makeLuaSprite('BottomBar', nil, 0, 720)
	makeGraphic('BottomBar', 1280, height, '000000')
	setObjectCamera('BottomBar', 'camHUD')
	addLuaSprite('BottomBar', true)

    TopY = getProperty('TopBar.y')
	BotY = getProperty('BottomBar.y')
    runHaxeCode([[
        FlxG.cameras.remove(game.camOther,false);
        FlxG.cameras.remove(game.camHUD,false);
        var camBAR = new FlxCamera();
        camBAR.bgColor = 0x00;
        setVar('camBAR',camBAR);
        game.getLuaObject('TopBar').camera = camBAR;
        game.getLuaObject('BottomBar').camera = camBAR;
        FlxG.cameras.add(camBAR,false);
        FlxG.cameras.add(game.camHUD,false);
        FlxG.cameras.add(game.camOther,false);
    ]])

end
local ease = 'quadOut'
function onEvent(n,v1,v2)
    if n == 'ChangeBarSize' then
        doTweenY('TopBar', 'TopBar', TopY + v2 * 2, v1, ease)
		doTweenY('BottomBar', 'BottomBar', BotY - v2 * 2, v1, ease)
    end
end
