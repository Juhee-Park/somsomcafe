-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	------ 변수 설정 ------
	-- 배경
	local background = display.newImage("img/main_background.png",display.contentCenterX, display.contentCenterY)
	-- 선택 재료 칸
	local box = display.newImage("img/main/what_I_choose.png", display.contentCenterX, display.contentCenterY)
	box.x = box.x - 156
	box.y = box.y - 986
	-- 만들기 버튼
	local makeButton = display.newImage("img/main/button/make.png", display.contentCenterX, display.contentCenterY)
	makeButton.x = makeButton.x + 520
	makeButton.y = makeButton.y - 986
	-- 물 버튼
	local waterB = display.newImage("img/recipe/water.png", display.contentCenterX, display.contentCenterY)
	waterB.x = waterB.x - 470
	waterB.y = waterB.y - 600
	-- 우유 버튼
	local milkB = display.newImage("img/recipe/milk.png",display.contentCenterX, display.contentCenterY)
	milkB.x = milkB.x - 470
	milkB.y = milkB.y - 350
	-- 시럽 버튼
	local syrupB = display.newImage("img/recipe/syrup.png", display.contentCenterX, display.contentCenterY)
	syrupB.x = syrupB.x - 470
	syrupB.y = syrupB.y - 100
	-- 에스프레소 버튼
	local espressoB = display.newImage("img/recipe/espresso.png", display.contentCenterX, display.contentCenterY)
	espressoB.x = espressoB.x - 150
	espressoB.y = espressoB.y - 525
	-- 얼음 버튼
	local iceB = display.newImage("img/recipe/ice.png",display.contentCenterX, display.contentCenterY)
	iceB.x = iceB.x + 150
	iceB.y = iceB.y - 525
	-- 초코 버튼
	local chocoB = display.newImage("img/recipe/choco.png", display.contentCenterX, display.contentCenterY)
	chocoB.x = chocoB.x + 475
	chocoB.y = chocoB.y - 525
	-- 딸기 버튼
	local strawberryB = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	strawberryB.x = strawberryB.x + 475
	strawberryB.y = strawberryB.y - 325
	-- 바나나 버튼 (임시 딸기 이미지 사용)
	local bananaB = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	bananaB.x = bananaB.x + 475
	bananaB.y = bananaB.y - 100
	-- 블루베리 버튼
	local blueberryB = display.newImage("img/recipe/blueberry.png", display.contentCenterX, display.contentCenterY)
	blueberryB.x = blueberryB.x + 475
	blueberryB.y = blueberryB.y + 100
	--물
	local water = display.newImage("img/recipe/water.png", display.contentCenterX, display.contentCenterY)
	water.y = water.y - 980
	water:toBack()
	--우유
	local milk = display.newImage("img/recipe/milk.png", display.contentCenterX, display.contentCenterY)
	milk.y = milk.y - 980
	milk:toBack()
	--시럽
	local syrup = display.newImage("img/recipe/syrup.png", display.contentCenterX, display.contentCenterY)
	syrup.y = syrup.y - 980
	syrup:toBack()
	--에스프레소
	local espresso = display.newImage("img/recipe/espresso.png", display.contentCenterX, display.contentCenterY)
	espresso.y = espresso.y - 980
	espresso:toBack()
	--얼음
	local ice = display.newImage("img/recipe/ice.png", display.contentCenterX, display.contentCenterY)
	ice.y = ice.y - 980
	ice:toBack()
	--초코
	local choco = display.newImage("img/recipe/choco.png", display.contentCenterX, display.contentCenterY)
	choco.y = choco.y - 980
	choco:toBack()
	--딸기
	local strawberry = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	strawberry.y = strawberry.y - 980
	strawberry:toBack()
	--바나나 (임시 딸기 이미지 사용)
	local banana = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	banana.y = banana.y - 980
	banana:toBack()
	--블루베리
	local blueberry = display.newImage("img/recipe/blueberry.png", display.contentCenterX, display.contentCenterY)
	blueberry.y = blueberry.y - 980
	blueberry:toBack()
	--아메리카노 (추후 알맞은 이미지로 대체)
	local americano = display.newImage("img/main/drink/coffee_img.png", display.contentCenterX, display.contentCenterY)
	americano.x = americano.x + 200
	americano.alpha = 0
	americano:toBack()
	--바닐라라떼 (추후 알맞은 이미지로 대체)
	local latte = display.newImage("img/main/drink/coffee_img.png", display.contentCenterX, display.contentCenterY)
	latte.x = latte.x + 200
	latte.alpha = 0
	latte:toBack()
	--카페모카 (추후 알맞은 이미지로 대체)
	local mocha = display.newImage("img/main/drink/coffee_img.png", display.contentCenterX, display.contentCenterY)
	mocha.x = mocha.x + 200
	mocha.alpha = 0
	mocha:toBack()
	--딸기 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_s = display.newImage("img/main/drink/smoothie_img.png", display.contentCenterX, display.contentCenterY)
	smoothie_s.x = smoothie_s.x + 200
	smoothie_s.alpha = 0
	smoothie_s:toBack()
	--바나나 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_ba = display.newImage("img/main/drink/smoothie_img.png", display.contentCenterX, display.contentCenterY)
	smoothie_ba.x = smoothie_ba.x + 200
	smoothie_ba:toBack()
	smoothie_ba.alpha = 0
	--블루베리 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_b = display.newImage("img/main/drink/smoothie_img.png", display.contentCenterX, display.contentCenterY)
	smoothie_b.x = smoothie_b.x + 200
	smoothie_b:toBack()
	smoothie_b.alpha = 0
	-- 재료 팝업 위한 변수 (selected[i]로 담겨진거 구분)
	------- 물: 1 / 우유: 2 / 시럽: 3
	------- 에스프레소: 4 / 얼음: 5
	------- 초코: 6 / 딸기: 7 / 바나나: 8 / 블루베리: 9
	local selected = {}
	for i = 1, 4 do
		selected[i] = 0
	end
	--설정된 음료 구분
	------- 아메리카노: 1 / 바닐라라떼: 2 / 카페모카: 3
	------- 딸기스무디: 4 / 바나나스무디: 5 / 블루베리스무디: 6
	local drinkMade = 0
	--숫자 세는 변수
	local cntNum

	------------------------------------------------
	sceneGroup:insert(water)
	sceneGroup:insert(milk)
	sceneGroup:insert(syrup)
	sceneGroup:insert(espresso)
	sceneGroup:insert(ice)
	sceneGroup:insert(choco)
	sceneGroup:insert(strawberry)
	sceneGroup:insert(banana)
	sceneGroup:insert(blueberry)
	sceneGroup:insert(americano)
	sceneGroup:insert(latte)
	sceneGroup:insert(mocha)
	sceneGroup:insert(smoothie_s)
	sceneGroup:insert(smoothie_ba)
	sceneGroup:insert(smoothie_b)
	sceneGroup:insert(background)
	sceneGroup:insert(box)
	sceneGroup:insert(makeButton)
	sceneGroup:insert(waterB)
	sceneGroup:insert(milkB)
	sceneGroup:insert(syrupB)
	sceneGroup:insert(espressoB)
	sceneGroup:insert(iceB)
	sceneGroup:insert(chocoB)
	sceneGroup:insert(strawberryB)
	sceneGroup:insert(bananaB)
	sceneGroup:insert(blueberryB)


--------------재료 선택 및 취소----------------------
	-- 물 선택 버튼
	local function water_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 1 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 1
					water:toFront()
					if i == 1 then
						water.x = 200
					elseif i == 2 then
						water.x = 440
					elseif i == 3 then
						water.x = 680
					elseif i == 4 then
						water.x = 920
					end
					break
				end
			end
		end
	end
	waterB:addEventListener("tap", water_button)
	
	-- 물 선택 취소
	local function water_delete(event)
		for i = 1, 5 do
			if selected[i] == 1 then
				selected[i] = 0
				water:toBack()
				break
			end
		end
	end
	water:addEventListener("tap", water_delete)


	-- 우유 선택 버튼
	local function milk_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 2 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 2
					milk:toFront()
					if i == 1 then
						milk.x = 200
					elseif i == 2 then
						milk.x = 440
					elseif i == 3 then
						milk.x = 680
					elseif i == 4 then
						milk.x = 920
					end
					break
				end
			end
		end
	end
	milkB:addEventListener("tap", milk_button)
	
	-- 우유 선택 취소
	local function milk_delete(event)
		for i = 1, 5 do
			if selected[i] == 2 then
				selected[i] = 0
				milk:toBack()
				break
			end
		end
	end
	milk:addEventListener("tap", milk_delete)


	-- 시럽 선택 버튼
	local function syrup_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 3 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 3
					syrup:toFront()
					if i == 1 then
						syrup.x = 200
					elseif i == 2 then
						syrup.x = 440
					elseif i == 3 then
						syrup.x = 680
					elseif i == 4 then
						syrup.x = 920
					end
					break
				end
			end
		end
	end
	syrupB:addEventListener("tap", syrup_button)
	
	-- 시럽 선택 취소
	local function syrup_delete(event)
		for i = 1, 5 do
			if selected[i] == 3 then
				selected[i] = 0
				syrup:toBack()
				break
			end
		end
	end
	syrup:addEventListener("tap", syrup_delete)

	
	-- 에스프레소 선택 버튼
	local function espresso_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 4 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 4
					espresso:toFront()
					if i == 1 then
						espresso.x = 200
					elseif i == 2 then
						espresso.x = 440
					elseif i == 3 then
						espresso.x = 680
					elseif i == 4 then
						espresso.x = 920
					end
					break
				end
			end
		end
	end
	espressoB:addEventListener("tap", espresso_button)
	
	-- 에스프레소 선택 취소
	local function espresso_delete(event)
		for i = 1, 5 do
			if selected[i] == 4 then
				selected[i] = 0
				espresso:toBack()
				break
			end
		end
	end
	espresso:addEventListener("tap", espresso_delete)


	-- 얼음 선택 버튼
	local function ice_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 5 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 5
					ice:toFront()
					if i == 1 then
						ice.x = 200
					elseif i == 2 then
						ice.x = 440
					elseif i == 3 then
						ice.x = 680
					elseif i == 4 then
						ice.x = 920
					end
					break
				end
			end
		end
	end
	iceB:addEventListener("tap", ice_button)
	
	-- 얼음 선택 취소
	local function ice_delete(event)
		for i = 1, 5 do
			if selected[i] == 5 then
				selected[i] = 0
				ice:toBack()
				break
			end
		end
	end
	ice:addEventListener("tap", ice_delete)


	-- 초코 선택 버튼
	local function choco_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 6 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 6
					choco:toFront()
					if i == 1 then
						choco.x = 200
					elseif i == 2 then
						choco.x = 440
					elseif i == 3 then
						choco.x = 680
					elseif i == 4 then
						choco.x = 920
					end
					break
				end
			end
		end
	end
	chocoB:addEventListener("tap", choco_button)
	
	-- 초코 선택 취소
	local function choco_delete(event)
		for i = 1, 5 do
			if selected[i] == 6 then
				selected[i] = 0
				choco:toBack()
				break
			end
		end
	end
	choco:addEventListener("tap", choco_delete)


	-- 딸기 선택 버튼
	local function strawberry_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 7 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 7
					strawberry:toFront()
					if i == 1 then
						strawberry.x = 200
					elseif i == 2 then
						strawberry.x = 440
					elseif i == 3 then
						strawberry.x = 680
					elseif i == 4 then
						strawberry.x = 920
					end
					break
				end
			end
		end
	end
	strawberryB:addEventListener("tap", strawberry_button)
	
	-- 딸기 선택 취소
	local function strawberry_delete(event)
		for i = 1, 5 do
			if selected[i] == 7 then
				selected[i] = 0
				strawberry:toBack()
				break
			end
		end
	end
	strawberry:addEventListener("tap", strawberry_delete)


	-- 바나나 선택 버튼
	local function banana_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 8 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 8
					banana:toFront()
					if i == 1 then
						banana.x = 200
					elseif i == 2 then
						banana.x = 440
					elseif i == 3 then
						banana.x = 680
					elseif i == 4 then
						banana.x = 920
					end
					break
				end
			end
		end
	end
	bananaB:addEventListener("tap", banana_button)
	
	-- 바나나 선택 취소
	local function banana_delete(event)
		for i = 1, 5 do
			if selected[i] == 8 then
				selected[i] = 0
				banana:toBack()
				break
			end
		end
	end
	banana:addEventListener("tap", banana_delete)


	-- 블루베리 선택 버튼
	local function blueberry_button(event)
		cntNum = 0
		for i = 1, 4 do
			if selected[i] == 9 then
				cntNum = cntNum + 1
			end
		end
		if cntNum == 0 then
			for i = 1, 4 do
				if selected[i] == 0 then
					selected[i] = 9
					blueberry:toFront()
					if i == 1 then
						blueberry.x = 200
					elseif i == 2 then
						blueberry.x = 440
					elseif i == 3 then
						blueberry.x = 680
					elseif i == 4 then
						blueberry.x = 920
					end
					break
				end
			end
		end
	end
	blueberryB:addEventListener("tap", blueberry_button)
	
	-- 블루베리 선택 취소
	local function blueberry_delete(event)
		for i = 1, 5 do
			if selected[i] == 9 then
				selected[i] = 0
				blueberry:toBack()
				break
			end
		end
	end
	blueberry:addEventListener("tap", blueberry_delete)
--------------------------------------------------------


--------------만들기 버튼----------------------	
	local function make_drink(event)
		if drinkMade == 0 then			--음료 없다면
			local waterCnt = 0
			local milkCnt = 0
			local syrupCnt = 0
			local espressoCnt = 0
			local iceCnt = 0
			local chocoCnt = 0
			local strawberryCnt = 0
			local bananaCnt = 0
			local blueberryCnt = 0 
			--재료 선택 여부 확인
			for i = 1, 4 do
				if selected[i] == 1 then
					waterCnt = waterCnt + 1
				elseif selected[i] == 2 then
					milkCnt = milkCnt + 1
				elseif selected[i] == 3 then
					syrupCnt = syrupCnt + 1
				elseif selected[i] == 4 then
					espressoCnt = espressoCnt + 1
				elseif selected[i] == 5 then
					iceCnt = iceCnt + 1
				elseif selected[i] == 6 then
					chocoCnt = chocoCnt  + 1 
				elseif selected[i] == 7 then
					strawberryCnt = strawberryCnt + 1
				elseif selected[i] == 8 then
					bananaCnt = bananaCnt + 1
				elseif selected[i] == 9 then
					blueberryCnt = blueberryCnt + 1
				end	
			end
			--아메리카노
			if waterCnt ~= 0 and milkCnt == 0 and syrupCnt == 0 and espressoCnt ~= 0 and iceCnt == 0
			 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt == 0 then
				drinkMade = 1
				water:toBack()
				espresso:toBack()
				americano:toFront()
				americano.alpha = 1
			end
			--바닐라라떼
			if waterCnt == 0 and milkCnt ~= 0 and syrupCnt ~= 0 and espressoCnt ~= 0 and iceCnt == 0
			 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt == 0 then
				drinkMade = 2
				milk:toBack()
				syrup:toBack()
				espresso:toBack()
				latte:toFront()
				latte.alpha = 1
			end
			--카페모카
			if waterCnt == 0 and milkCnt ~= 0 and syrupCnt == 0 and espressoCnt ~= 0 and iceCnt == 0
			 and chocoCnt ~= 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt == 0 then
				drinkMade = 3
				milk:toBack()
				espresso:toBack()
				choco:toBack()
				mocha:toFront()
				mocha.alpha = 1
			end
			--딸기스무디
			if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
			 and chocoCnt == 0 and strawberryCnt ~= 0 and bananaCnt == 0 and blueberryCnt == 0 then
				drinkMade = 4
				syrup:toBack()
				ice:toBack()
				strawberry:toBack()
				smoothie_s:toFront()
				smoothie_s.alpha = 1
			end
			--바나나스무디
			if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
			 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt ~= 0 and blueberryCnt == 0 then
				drinkMade = 5
				syrup:toBack()
				ice:toBack()
				banana:toBack()
				smoothie_ba:toFront()
				smoothie_ba.alpha = 1
			end
			--블루베리스무디
			if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
			 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt ~= 0 then
				drinkMade = 6
				syrup:toBack()
				ice:toBack()
				blueberry:toBack()
				smoothie_b:toFront()
				smoothie_b.alpha = 1
			end
			--초기화
			if drinkMade ~= 0 then
				for i = 1, 4 do
					selected[i] = 0
				end
			end
		end
	end
	makeButton:addEventListener("tap", make_drink)

------------------음료 건네기-----------------------------------------

	local function catchDrink( event )
	 	if (event.phase == "began") then

	 		display.getCurrentStage():setFocus( event.target )
	 		event.target.isFocus = true
	 	elseif (event.phase == "moved" ) then
	 		if (event.target.isFocus ) then
	 			event.target.x = event.xStart + event.xDelta
	 			event.target.y = event.yStart + event.yDelta

	 		end
	 	elseif (event.phase == "ended" or event.phase == "cancelled" ) then
	 		if (event.target.isFocus ) then
	 			--테이블에 놓으면
	 			if  1020 < event.target.x and event.target.x < 1270
 					and 1680 < event.target.y  and event.target.y < 1780 then
 					if drinkMade == 1 then
 						drinkMade = 0
 						americano.alpha = 0
 					elseif drinkMade == 2 then
 						drinkMade = 0
 						latte.alpha = 0
 					elseif drinkMade == 3 then
 						drinkMade = 0
 						mocha.alpha = 0
 					elseif drinkMade == 4 then
 						drinkMade = 0
 						smoothie_s.alpha = 0
 					elseif drinkMade == 5 then
 						drinkMade = 0
 						smoothie_ba.alpha = 0
 					elseif drinkMade == 6 then
 						drinkMade = 0
 						smoothie_b.alpha = 0
 					end
	 				-- 원래 자리로 돌아감
	 				event.target.x = event.xStart
	 				event.target.y = event.yStart
	 			else
	 				-- 원래 자리로 돌아감
	 				event.target.x = event.xStart
	 				event.target.y = event.yStart
	 			end

	 		display.getCurrentStage():setFocus(nil)
	 		event.target.isFocus = false
	 		end
	 		display.getCurrentStage():setFocus(nil)
	 		event.target.isFocus = false
	 	end
	 end
	 americano:addEventListener("touch", catchDrink)
	 latte:addEventListener("touch", catchDrink)
	 mocha:addEventListener("touch", catchDrink)
	 smoothie_s:addEventListener("touch", catchDrink)
	 smoothie_ba:addEventListener("touch", catchDrink)
	 smoothie_b:addEventListener("touch", catchDrink)
----------------------------------------------------------------------------


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