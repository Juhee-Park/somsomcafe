-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- 배경이미지 추가(솜1,2,3가 다 그려져있는 배경이라 수정이 필요할 것 같아요)
	local background = display.newImageRect("img/main_background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	-- 문 이미지 추가
	local door = display.newImage("img/main/button/door.png")
 	-- door.x, door.y = display.contentWidth*0.0358, display.contentHeight*0.84
 	door.x = door.x + 52
 	door.y = door.y + 2155

 	-- 문을 클릭하면 손님 2명의 이미지가 화면에 나타남
 	local function tapEventListener( event )

 		local somGroup = display.newGroup()
 		local som = {}

 		for i =1,2 do
 			som[i] = display.newImageRect(somGroup, "img/main/character/customer", 312, 480)
 			som[i].x , som[i].y= display.contentWidth*0.25 + 400*(i-1), display.contentHeight*0.82
 		end
 	end

 	door:addEventListener("tap",tapEventListener)


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
