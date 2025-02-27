--GoldenPorkchops can code I swear
local CanUse = true

function onUpdatePost()
	if CanUse then
   		if getProperty("healthBar.percent") < 20 then
      			setProperty("health", 1)
      			triggerEvent('Play Animation', 'heal', 'gf') --Change singUP to whatever the kiss animation is called
      			CanUse = false --nah fuck you lol
   		 end  
	end
end
