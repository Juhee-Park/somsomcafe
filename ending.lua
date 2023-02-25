-----------------------------------------------------------------------------------------
--
-- ending.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
    --클리어 화면 출력
	local background = display.newImageRect("image/clear_background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
    --게임종료
	local out = display.newImageRect("image/clear/out.png", 1000, 200)
	out.x, out.y = display.contentWidth*0.5, display.contentHeight*0.9
    --다시하기 
	local retry = display.newImageRect("iamge/clear/retry.png",1000 , 200)
	retry.x, retry.y = display.contentWidth*0.5, display.contentHeight*0.8
    --클리어
	local clear = display.newImageRect("image/clear/clear.png", 1000, 200)
	clear.x, clear.y = display.contentWidth*0.5, display.contentHeight*0.15

	sceneGroup:insert(background)
	sceneGroup:insert(out)
	sceneGroup:insert(retry)
	sceneGroup:insert(clear)

	function retry:tap( event )
 		--
 	end

 	retry:addEventListener("tap", retry) -- 다시하기 누르면 게임화면으로

	sceneGroup:insert(out)
	sceneGroup:insert(retry)

	function retry:tap( event )
		composer.gotoScene('view1')
	end

end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.

	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)


	elseif phase == "did" then
		-- Called when the scene is now off screen

	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene