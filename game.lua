-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect("main_background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	
	local score = display.newText(0, 660, 660, display.contentWidth*0.1, display.contentHeight*0.15) --성공시 점수
	score.size = 100
	score:setFillColor(0)
	--score.alpha = 0.5

	local ordern = display.newImageRect("success_count.png", 500, 150)
	ordern.x, ordern.y = display.contentWidth*0.22, display.contentHeight*0.21


	local scoref = display.newText(0, 1600, 660, display.contentWidth*0.5, display.contentHeight*0.15) --실패시 점수
	scoref.size = 100
	scoref:setFillColor(0)
	--scoref.alpha = 0.5
	local orderm = display.newImageRect("fail_count.png", 500, 150)
	orderm.x, orderm.y = display.contentWidth*0.66, display.contentHeight*0.21
	
	
	sceneGroup:insert(background)
	sceneGroup:insert(ordern)
	sceneGroup:insert(orderm)
	sceneGroup:insert(score)
	sceneGroup:insert(scoref)
	
	if  true then --제조 성공시
		score.text = score.text+1
		if (score.text == '20') then
		--score.text = 'clear!'
		--time.alpha = 0
		composer.gotoScene('ending')
		end
	else 	
		scoref.text = scoref.text+1
		if (scoref.text == '5') then
		composer.gotoScene('endingf')
		end
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
