-----------------------------------------------------------------------------------------
--
-- clear.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
    --클리어 화면 출력
	local background = display.newImage("img/clear_background.png", display.contentCenterX, display.contentCenterY)
    --게임종료 (임시로 작게 만듦)
	local out = display.newImageRect("img/clear/out.png", display.contentWidth/3, display.contentHeight/12)
	--local out = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
	out.x = 1050
	out.y = 2300
    --다시하기 (임시로 작게 만듦)
	local retry = display.newImageRect("img/clear/retry.png", display.contentWidth/3, display.contentHeight/12)
	--local retry = display.newImage("img/clear/retry.png", display.contentCenterX, display.contentCenterY)
	retry.x = 400
	retry.y = 2300
    --클리어
	local clear = display.newImage("img/clear/clear.png", display.contentCenterX, display.contentCenterY)
	clear.y = clear.y - 880	
	--평균 소요 시간
	local avgTimeText = display.newText("평균 소요 시간 : ", display.contentCenterX, display.contentCenterY)
	avgTimeText.size = 100
	avgTimeText:setFillColor(0)
	avgTimeText.x = avgTimeText.x - 200
	avgTimeText.y = avgTimeText.y + 400
	--학점
	local gradeText = display.newText("학점 : ", display.contentCenterX, display.contentCenterY)
	gradeText.size = 100
	gradeText:setFillColor(0)
	gradeText.x = gradeText.x - 350
	gradeText.y = gradeText.y + 550
	--진엔딩 조건 팁
	local gameTip = display.newText("<   Tip : 함께 노력해서 A+ 을 받아보자!   >", display.contentCenterX, display.contentCenterY)
	gameTip.size = 70
	gameTip:setFillColor(0)
	gameTip.y = gameTip.y + 750
	-- 출력하는 학점
	local grade = display.newText("F", display.contentCenterX, display.contentCenterY)
	grade.size = 100
	grade:setFillColor(0)
	grade.x = grade.x - 150
	grade.y = grade.y + 550
	--출력하는 평균 시간
	local avgTimeN = display.newText("1.9", display.contentCenterX, display.contentCenterY)
	avgTimeN.size = 100
	avgTimeN:setFillColor(0)
	avgTimeN.x = avgTimeN.x + 250
	avgTimeN.y = avgTimeN.y + 400
	-- 받아오는 평균 소요 시간
	local avgTime = 3
	-- 학교 건물 사진
	local schoolImg

	sceneGroup:insert(background)
	sceneGroup:insert(clear)
	sceneGroup:insert(retry)
	sceneGroup:insert(out)
	sceneGroup:insert(avgTimeText)
	sceneGroup:insert(gradeText)
	sceneGroup:insert(grade)
	sceneGroup:insert(avgTimeN)
	sceneGroup:insert(gameTip)

	--------------------평균 소요 시간에 따른 결과 화면 출력-------------------------------------

	if avgTime <= 1.9 then
		grade.text = 'A+'
		avgTimeN.text = avgTime .. ' 초'
		gameTip.text = '<    Tip : 이건 김딸기 교수님께서 \n      제일 좋아하시는 레시피잖아? \n      교수님께 만들어드리자!          >'
		gameTip.size = 60
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	elseif avgTime <= 2.9 then
		grade.text = 'A'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	elseif avgTime <= 3.9 then
		grade.text = 'B+'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	elseif avgTime <= 4.9 then
		grade.text = 'B'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	elseif avgTime <= 5.9 then
		grade.text = 'C+'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	elseif avgTime <= 6.9 then
		grade.text = 'C'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	elseif avgTime <= 7.9 then
		grade.text = 'D+'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	else
		grade.text = 'D'
		avgTimeN.text = avgTime.. ' 초'
		--추후 수정 필요
		schoolImg = display.newImage("img/clear/out.png", display.contentCenterX, display.contentCenterY)
		schoolImg.y = schoolImg.y - 200
		sceneGroup:insert(schoolImg)
	end



	local function retry_button(event)
		print("시작화면으로")
		composer.gotoScene('start')
	end
 	retry:addEventListener("tap", retry_button) -- 다시하기 누르면 게임화면으로

 	local function out_button(event)
		native.requestExit()
 	end
 	out:addEventListener("tap", out_button)
	
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
		composer.removeScene('end')
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