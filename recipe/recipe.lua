-----------------------------------------------------------------------------------------
--
-- recipe.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local group = display.newGroup()

	local bg = display.newImage(group,'img/recipe_background.png')
	bg.x, bg.y = display.contentWidth/2, display.contentHeight/2
	bg.alpha = 0.5


	-- 재료 
	local tableGroup = display.newGroup()

 	local in_table = {}
 	local line = {}
 	local drink = {}
 	local ingredient = {}
 	-- americano
 	in_table[1] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.199)
 	line[1] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.255)
 	drink[1] = display.newImage(tableGroup, "img/recipe/americano.png", display.contentWidth*0.18, display.contentHeight*0.199)
	ingredient[1] = display.newImage(tableGroup, "img/recipe/espresso.png", display.contentWidth*0.5, display.contentHeight*0.199)
	ingredient[2] = display.newImage(tableGroup, "img/recipe/water.png", display.contentWidth*0.75, display.contentHeight*0.199)
	-- vanilla_latte
	in_table[2] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.33)
 	line[2] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.385)
 	drink[2] = display.newImage(tableGroup, "img/recipe/vanilla_latte.png", display.contentWidth*0.18, display.contentHeight*0.33)
	ingredient[3] = display.newImage(tableGroup, "img/recipe/espresso.png", display.contentWidth*0.45, display.contentHeight*0.33)
	ingredient[4] = display.newImage(tableGroup, "img/recipe/milk.png", display.contentWidth*0.63, display.contentHeight*0.33)
	ingredient[5] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.33)
	-- cafe_moca
	in_table[3] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.46)
 	line[3] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.51)
 	drink[3] = display.newImage(tableGroup, "img/recipe/vanilla_latte.png", display.contentWidth*0.18, display.contentHeight*0.46)
	ingredient[6] = display.newImage(tableGroup, "img/recipe/espresso.png", display.contentWidth*0.45, display.contentHeight*0.46)
	ingredient[7] = display.newImage(tableGroup, "img/recipe/milk.png", display.contentWidth*0.63, display.contentHeight*0.46)
	ingredient[8] = display.newImage(tableGroup, "img/recipe/choco.png", display.contentWidth*0.8, display.contentHeight*0.46)
	-- blueberry_smoothie
	in_table[4] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.59)
 	line[4] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.64)
 	drink[4] = display.newImage(tableGroup, "img/recipe/blueberry_smoothie.png", display.contentWidth*0.16, display.contentHeight*0.59)
	ingredient[9] = display.newImage(tableGroup, "img/recipe/ice.png", display.contentWidth*0.45, display.contentHeight*0.59)
	ingredient[10] = display.newImage(tableGroup, "img/recipe/blueberry.png", display.contentWidth*0.63, display.contentHeight*0.59)
	ingredient[11] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.59)
	-- strawberry_smoothie
	in_table[5] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.715)
 	line[5] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.77)
 	drink[5] = display.newImage(tableGroup, "img/recipe/strawberry_smoothie.png", display.contentWidth*0.16, display.contentHeight*0.715)
	ingredient[12] = display.newImage(tableGroup, "img/recipe/ice.png", display.contentWidth*0.45, display.contentHeight*0.715)
	ingredient[13] = display.newImage(tableGroup, "img/recipe/strawberry.png", display.contentWidth*0.63, display.contentHeight*0.715)
	ingredient[14] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.715)
	-- banna_smoothie
	in_table[6] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.84)
 	line[6] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.895)
 	drink[6] = display.newImage(tableGroup, "img/recipe/banana_smoothie.png", display.contentWidth*0.16, display.contentHeight*0.84)
	ingredient[15] = display.newImage(tableGroup, "img/recipe/ice.png", display.contentWidth*0.45, display.contentHeight*0.84)
	ingredient[16] = display.newImage(tableGroup, "img/recipe/banana.png", display.contentWidth*0.63, display.contentHeight*0.84)
	ingredient[17] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.84)


	-- 레시피 나가기
	local recipe_x = display.newImage(group, "img/recipe/recipe_out.png")
	recipe_x.x, recipe_x.y = display.contentWidth *0.87, display.contentHeight*0.08

	function recipe_x:tap( event )
		composer.gotoScene('ex')
	end
	recipe_x:addEventListener("tap", recipe_x)

	sceneGroup:insert(group)
	sceneGroup:insert(tableGroup)
	sceneGroup:insert(recipe_x)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		
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