-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
		
local success = 0						-- 게임 성공 횟수.
local fail = 0							-- 게임 실패 횟수.

local drinkImage = {"smoothie_img", "coffee_img"}	-- 음료 이미지 주소. 나중에 모든 음료 이미지가 완성되면 수정 및 추가가 필요합니다. (랜덤 함수를 활용하기 위한 변수입니다.)
local customerImage = {"customer"}					-- 손님 이미지 주소. 나중에 모든 손님 이미지가 완성되면 수정 및 추가가 필요합니다. (랜덤 함수를 활용하기 위한 변수입니다.)

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect("img/main_background.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	sceneGroup:insert(background)				

	local timeBar = nil						-- 음료 위에 표시되는 시간 제한 바.
	local count = 0							-- 시간 제한 카운트 변수.

	local menu = nil						-- 손님 위에 표시되는 음료 이미지.
	local dialog = nil						-- 손님이 음료를 요구하는 대화창 이미지.
	local bar = nil							-- 진행상황 이미지.

	local customer = {} 					-- 손님 배열로 화면의 왼쪽부터 차례대로 1, 2, 3번. 
	local customerGroup = display.newGroup()	

	-- 시간 제한 카운터 함수.
	local function counter( event )		
		count = count + 1

		if timeBar == nil then 				-- 시간 소요를 나타내는 바 생성. 시간이 지날 수록 바의 크기가 줄어들게 설정했습니다. (10초)
			timeBar = display.newRect(display.contentWidth*0.59, display.contentHeight*0.6, 353 - 35.3*count, 64)
		else
			timeBar.width, timeBar.x = 353 - 35.3 * count, display.contentWidth*0.59 - 17.16 * (count-1)
		end

		timeBar:setFillColor(1, 0, 0)		-- 바의 색깔은 빨강색으로 했습니다. 

		if count == 10 then
			count = 0						-- 10초가 지났기 때문에 count를 다시 0으로 바꿉니다. (0초부터 다시 세기)
			fail = fail + 1					-- 타임 아웃으로 실패 횟수 늘립니다. 

			newCustomerEnter()				-- 타임 아웃 후 새 손님을 받습니다. 
		end
	end
						
	-- 메뉴를 랜덤으로 생성합니다. 현재는 이미지가 coffee와 smoothie 총 2개라 랜덤을 2로 돌렸습니다. 
	local function orderMenu() 				
		if menu ~= nil then					-- 음료 이미지가 이미 화면에 있다면 이를 먼저 지우고 시작합니다. 
			display.remove(menu)
		end

		if dialog == nil and bar == nil then	-- 대화창 이미지와 시간제한 이미지가 화면에 생성되어 있지 않다면 먼저 생성하고 시작합니다. 
			dialog = display.newImage("img/main/talk_space/demand.png")
			dialog.x, dialog.y = display.contentWidth*0.59, display.contentHeight*0.675

			bar = display.newImage("img/main/talk_space/time_limit.png")
			bar.x, bar.y = display.contentWidth*0.59, display.contentHeight*0.6

			sceneGroup:insert(dialog)
		end

		local pickMenu = math.random(2) 		-- 음료 이미지가 추가되면 수정이 필요합니다. (음료 이미지 개수로 수정해야 함.)
		menu = display.newImage("img/main/drink/"..drinkImage[pickMenu]..".png")

		-- 커피류 음료와 스무디류 음료의 이미지 크기가 다르기 때문에 위치를 따로 잡아줬습니다. 
		if pickMenu == 1 then					-- 스무디류 음료를 뽑았을 때. 나중에 음료 이미지가 추가되면 수정이 필요합니다.(drinkImage array의 스무디류 인덱스 추가.)
			menu.x, menu.y = display.contentWidth*0.57, display.contentHeight*0.664
		else									-- 커피류 음료를 뽑았을 때. 
			menu.x, menu.y = display.contentWidth*0.6, display.contentHeight*0.67
		end

		sceneGroup:insert(menu)

		if success < 20 and fail < 5 then											-- 성공 횟수와 실패 횟수가 각각 20번, 5번 미만이라면 타이머를 시작합니다. (게임 종료 시 타이머 기능을 사용하지 않기 위해서 조건문 사용.)
			local timeAttack = timer.performWithDelay(1000, counter, 10)			-- 10초 카운트 시작 
		end
	end

	-- 새 손님 넣기. 음료 제조에 성공했을 때에도 newCustomerEnter 함수를 호출해야 합니다. 
	function newCustomerEnter() 
		local pickCustomer

		-- 3번 칸에 손님 이미지가 있다면 이를 먼저 지웁니다. 
		if customer[3] ~= null then				
			display.remove(customer[3])
		end
			
		-- 2번 칸에 있던 손님 이미지를 3번 칸 위치로 옮기고 customer[3]이 3번 칸으로 이동된 customer[2]를 가리키게 합니다. 
		customer[2].x, customer[2].y = display.contentWidth*0.78, display.contentHeight*0.83	
		customer[3] = customer[2]

		-- 1번 칸에 있던 손님 이미지를 2번 칸 위치로 옮기고 customer[2]가 2번 칸으로 이동된 customer[1]을 가리키게 합니다. 
		customer[1].x, customer[1].y = display.contentWidth*0.52, display.contentHeight*0.83
		customer[2] = customer[1]

		pickCustomer = math.random(1)		-- 나중에 손님 이미지가 추가되면 수정이 필요합니다. (손님 이미지 개수로 수정해야 함.)
		customer[1] = display.newImage(customerGroup, "img/main/character/"..customerImage[pickCustomer]..".png")
		customer[1].x, customer[1].y = display.contentWidth*0.26, display.contentHeight*0.83

		sceneGroup:insert(customerGroup)

		orderMenu()
	end

	-- 메뉴를 받기 전 손님 2명을 먼저 받아야 합니다. (손님 이미지 2개 화면에 추가)
	orderMenu()				-- 처음 손님이 들어온 후 메뉴를 주문합니다. 

	sceneGroup:insert(customerGroup)
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