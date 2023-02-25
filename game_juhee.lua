-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	--------------------------------------------------------------------------------------------------------------------
	-- 게임 시작 시 팝업 출력 (작업자 : 박주희)        완료

	-- 배경이미지 삽입
	local background = display.newImageRect("img/main_background.png", display.contentWidth, display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2


	-- 팝업 이미지 삽입 
	local popup = display.newImage("img/main_popup/popup.png")
 	popup.x, popup.y = 735, 2000

	-- 팝업 버튼 이미지 삽입
	local popup_button = display.newImage("img/main_popup/popup_button.png")
 	popup_button.x, popup_button.y = 1176, 2242

	-- 팝업 닫기 이벤트
	local function popupOff( event )  
 		if( event.phase == "began" ) then  
 			display.remove(popup) 
			display.remove(popup_button) 
 		end  
 	end
	 
	-- 팝업 닫기 이벤트 적용
	popup_button:addEventListener("touch", popupOff)
	 --------------------------------------------------------------------------------------------------------------------
	
	
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