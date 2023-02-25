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
	-- ���� ���� �� �˾� ��� (�۾��� : ������)        �Ϸ�

	-- ����̹��� ����
	local background = display.newImageRect("img/main_background.png", display.contentWidth, display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2


	-- �˾� �̹��� ���� 
	local popup = display.newImage("img/main_popup/popup.png")
 	popup.x, popup.y = 735, 2000

	-- �˾� ��ư �̹��� ����
	local popup_button = display.newImage("img/main_popup/popup_button.png")
 	popup_button.x, popup_button.y = 1176, 2242

	-- �˾� �ݱ� �̺�Ʈ
	local function popupOff( event )  
 		if( event.phase == "began" ) then  
 			display.remove(popup) 
			display.remove(popup_button) 
 		end  
 	end
	 
	-- �˾� �ݱ� �̺�Ʈ ����
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