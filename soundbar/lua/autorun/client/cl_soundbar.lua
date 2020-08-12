
 -- :SetSize( ScrW() * x/1920, ScrH() * y/1080 )
local soundTranslater = nil
local admin = "ulx playsound "
local ChosenColor = Color(0, 0, 0, 237)
local ButtonColor = Color(255, 255, 255, 61)
local ButtonTextColour = Color(0, 0, 0)
local ply = LocalPlayer()
local defaultText01 = "vo/npc/female01/moan02.wav"

local vkBind = {}--[[
	kb1 = "",
	kb2 = "",
	kb3 = "",
	kb4 = "",
	kb5 = "",
	kb6 = "",
	kb7 = "",
	kb8 = "",
	kb9 = "" }-]]

function SaveData()
	local data = util.TableToJSON(vkBind)
	if data==nil then print("no data to save!") return end
	file.Write("sbdevkeybinds.json", data)
end

function ReadData()
	
	local JSONData = file.Read("sbdevkeybinds.json")
		if JSONData==nil then print("No keybind file") return end
	vkBind = util.JSONToTable(JSONData)
	print("data loaded")
end

function playASong(soundTranslater)
	if soundTranslater==nil then print("no file path given") return 
	else LocalPlayer():ConCommand(admin .. soundTranslater) end
	--RunConsoleCommand(admin .. command .. soundTranslater)
end
--local allowedFolders = {"vo","ambient","bot","radio","weapons","phx"}
local ignition = false
function helloSound()
Frame = vgui.Create( "DFrame" )
Frame:SetPos( 300, 200 ) 
Frame:SetSize( ScrW() * 520/1920, ScrH() * 430/1080 )
Frame:SetTitle( "Silent's Sound Bar. Inspired by Rhys" ) 
Frame:SetVisible( true ) 
Frame:SetDraggable( true ) 
Frame:ShowCloseButton( true ) 
Frame:MakePopup()
Frame.Paint = function( self, w, h )
	draw.RoundedBox( 10, 0, 0, w, h, ChosenColor ) 
	end


local Button = vgui.Create("DButton", Frame)
Button:SetText( "Play Sound" )
Button:SetTextColor(ButtonTextColour)
Button:SetPos( 40, 45 )
Button:SetSize( ScrW() * 190/1920, ScrH() * 140/1080 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, ButtonColor ) 
end
Button.DoClick = function()
	print( "I was clicked!" )
	local Frame = vgui.Create( "DFrame" )
Frame:SetPos( ScrW() * 520/1920, ScrH() * 430/1080 )
Frame:SetSize( ScrW() * 520/1920, ScrH() * 160/1080 )
Frame:SetTitle( "Enter file path into text bar HIT ENTER and hit PLAY" ) 
Frame:SetVisible( true ) 
Frame:SetDraggable( true ) 
Frame:ShowCloseButton( true ) 
Frame:MakePopup()
Frame.Paint = function( self, w, h )
	draw.RoundedBox( 10, 0, 0, w, h, ChosenColor ) 
	end
	
	
local soundEntry = vgui.Create( "DTextEntry", Frame )
soundEntry:SetPos( 30, 110 )
soundEntry:SetSize( ScrW() * 460/1920, ScrH() * 40/1080 )
soundEntry:SetText( defaultText01 )


local playButton = vgui.Create("DButton", Frame)
playButton:SetText( "P L A Y" )
playButton:SetTextColor(ButtonTextColour)
playButton:SetPos( 30, 45 )
playButton:SetSize( ScrW() * 460/1920, ScrH() * 50/1080 )
playButton.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, ButtonColor ) 
end

soundEntry.OnEnter = function(self)
	soundTranslater = self:GetValue()
	print(soundTranslater .. "SUCCEED")
	end

playButton.DoClick = function()
	
	print("Playing: " .. soundTranslater)
playASong(soundTranslater)
end
end



local Button2 = vgui.Create("DButton", Frame)
Button2:SetText( "Browse sounds" )
Button2:SetTextColor(ButtonTextColour)
Button2:SetPos( 270, 45 )
Button2:SetSize( ScrW() * 190/1920, ScrH() * 140/1080 )
Button2.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, ButtonColor ) 
end


local Settings = vgui.Create("DButton", Frame)
Settings:SetText( "Settings" )
Settings:SetTextColor(ButtonTextColour)
Settings:SetPos( 40, 240 )
Settings:SetSize( ScrW() * 190/1920, ScrH() * 140/1080 )
Settings.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, ButtonColor ) 
end

Settings.DoClick = function()
	print( "I was clicked!" )
	local Frame = vgui.Create( "DFrame" )
	Frame:SetPos( ScrW() * 900/1920, ScrH() * 540/1080 ) 
	Frame:SetSize( ScrW() * 500/1920, ScrH() * 300/1080 )
	Frame:SetTitle( "Settings" ) 
	Frame:SetVisible( true ) 
	Frame:SetDraggable( true ) 
	Frame:ShowCloseButton( true ) 
	Frame:MakePopup()
	Frame.Paint = function( self, w, h )
	draw.RoundedBox( 10, 0, 0, w, h, Color( 40, 40, 40, 255 ) ) end

local creator = vgui.Create( "RichText", Frame )
creator:SetSize(200,100)
creator:SetPos(350,200)
creator:InsertColorChange(255, 0, 0, 255)
creator:AppendText("Created by SilentK")

local Help = vgui.Create("DButton", Frame)
Help:SetText( "HELP ME" )
Help:SetTextColor(ButtonTextColour)
Help:SetPos( 275, 50 )
Help:SetSize( ScrW() * 190/1920, ScrH() * 50/1080 )
Help.Paint = function( self, w, h )
	draw.RoundedBox( 5, 0, 0, w, h, ButtonColor )
end

Help.DoClick = function()
local frame = vgui.Create("DFrame")
frame:SetPos( ScrW() * 200/1920, ScrH() * 120/1080 ) 
frame:SetTitle( "Help" ) 
frame:SetSize(200, 150)
frame:Center()
frame:MakePopup()

-- Rich Text panel
local text = vgui.Create( "RichText", frame )
text:Dock( FILL )

-- Text segment #1 (grayish color)
text:InsertColorChange(255, 255, 224, 255)
text:AppendText([[To save a keybind, go to file browser and select a file
and then hit the keybind button you wish to save it to.
To play a keybind, go to the menu and select
virtual keybinds and play whichever one you
want. To play a sound/ you must enter the file path
and hit enter then play."]] )

end

local ColorPicker = vgui.Create( "DColorMixer", Frame )
ColorPicker:SetSize( 200, 200 )
ColorPicker:SetPos(50, 50)
ColorPicker:SetPalette( true )
ColorPicker:SetAlphaBar( true ) 
ColorPicker:SetWangs( true )
ColorPicker:SetColor( Color( 255, 255, 255 ) )

local ConfirmColor = vgui.Create("DButton", Frame)
ConfirmColor:SetText( "Background Set" )
ConfirmColor:SetSize( 90, 30 )
ConfirmColor:SetPos( 50, Frame:GetTall() - 40 )
ConfirmColor.Paint = function( self, w, h )
	draw.RoundedBox( 10, 0, 0, w, h, Color( 255, 255, 255, 180 ) ) end
ConfirmColor.DoClick = function()
	ChosenColor = ColorPicker:GetColor() 
			
	PrintTable(ChosenColor) 
end

local ConfirmButtonColor = vgui.Create("DButton", Frame)
ConfirmButtonColor:SetText( "Button Set" )
ConfirmButtonColor:SetSize( 90, 30 )
ConfirmButtonColor:SetPos( 150, Frame:GetTall() - 40 )
ConfirmButtonColor.Paint = function( self, w, h )
	draw.RoundedBox( 10, 0, 0, w, h, Color( 255, 255, 255, 180 ) ) end
ConfirmButtonColor.DoClick = function()
	ButtonColor = ColorPicker:GetColor()
			
	PrintTable(ButtonColor) 
end
end

local Button4 = vgui.Create("DButton", Frame)
Button4:SetText( "Play Bindings" )
Button4:SetTextColor(ButtonTextColour)
Button4:SetPos( 270, 240 ) 
Button4:SetSize( ScrW() * 190/1920, ScrH() * 140/1080 )
Button4.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, ButtonColor ) 
end


Button2.DoClick = function()
	Button:SetVisible(false)
	Button2:SetVisible(false)
	Button4:SetVisible(false)
	Settings:SetVisible(false)
	Frame:SetSize( ScrW() * 520/1920, ScrH() * 540/1080 )
		local manager = vgui.Create("DFileBrowser", Frame)
		manager:SetSize( ScrW() * 420/1920, ScrH() * 445/1080 )
		manager:SetPos(25,25)
		manager:SetBaseFolder("sound")
		manager:SetPath("GAME")
		manager:SetOpen( true ) 
	--	manager:SetSearch("vo")
	--	manager:SetCurrentFolder("vo")
		manager:SetFileTypes(".wav")
		function manager:OnSelect( path, pnl )
print("path selected: " .. path)
print("conversion")
path = string.gsub(path, "sound/","")
print(path .. " endresult")
soundTranslater = path
end
function manager:OnDoubleClick(path, pnl) 
path = string.gsub(path, "sound/","")
soundTranslater = path
playASong(soundTranslater)
end
		local playB = vgui.Create("DButton", Frame)
			playB:SetText( "Play" )
			playB:SetTextColor(ButtonTextColour)
			playB:SetPos( 450, 40 )
			playB:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			playB.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		playB.DoClick = function()
		playASong(soundTranslater)
		end
				local backB = vgui.Create("DButton", Frame)
			backB:SetText( "Back" )
			backB:SetTextColor(ButtonTextColour)
			backB:SetPos( 450, 80 )
			backB:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			backB.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor )
			end

		--start of browser kb save buttons
		local menubind1 = vgui.Create("DButton", Frame)
			menubind1:SetText( "Bind 1" )
			menubind1:SetTextColor(ButtonTextColour)
			menubind1:SetPos( 450, 120 )
			menubind1:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind1.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind1.DoClick = function()
		vkBind.kb1 = soundTranslater
		
		SaveData()
		print("Saved: " .. vkBind.kb1) 

		end
		local menubind2 = vgui.Create("DButton", Frame)
			menubind2:SetText( "Bind 2" )
			menubind2:SetTextColor(ButtonTextColour)
			menubind2:SetPos( 450, 160 )
			menubind2:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind2.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind2.DoClick = function()
		vkBind.kb2 = soundTranslater
		print(vkBind.kb2) 
		SaveData()
		end
		local menubind3 = vgui.Create("DButton", Frame)
			menubind3:SetText( "Bind 3" )
			menubind3:SetTextColor(ButtonTextColour)
			menubind3:SetPos( 450, 200 )
			menubind3:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind3.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind3.DoClick = function()
		vkBind.kb3 = soundTranslater
		print(vkBind.kb3) 
		SaveData()
		end
		local menubind4 = vgui.Create("DButton", Frame)
			menubind4:SetText( "Bind 4" )
			menubind4:SetTextColor(ButtonTextColour)
			menubind4:SetPos( 450, 240 )
			menubind4:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind4.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind4.DoClick = function()
		vkBind.kb4 = soundTranslater
		print(vkBind.kb4) 
		SaveData()
		end
		local menubind5 = vgui.Create("DButton", Frame)
			menubind5:SetText( "Bind 5" )
			menubind5:SetTextColor(ButtonTextColour)
			menubind5:SetPos( 450, 280 )
			menubind5:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind5.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind5.DoClick = function()
		vkBind.kb5 = soundTranslater
		print(vkBind.kb5) 
		SaveData()
		end
		local menubind6 = vgui.Create("DButton", Frame)
			menubind6:SetText( "Bind 6" )
			menubind6:SetTextColor(ButtonTextColour)
			menubind6:SetPos( 450, 320 )
			menubind6:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind6.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind6.DoClick = function()
		vkBind.kb6 = soundTranslater
		print(vkBind.kb6) 
		SaveData()
		end
		local menubind7 = vgui.Create("DButton", Frame)
			menubind7:SetText( "Bind 7" )
			menubind7:SetTextColor(ButtonTextColour)
			menubind7:SetPos( 450, 360 )
			menubind7:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind7.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind7.DoClick = function()
		vkBind.kb7 = soundTranslater
		print(vkBind.kb7) 
		SaveData()
		end

		local menubind8 = vgui.Create("DButton", Frame)
			menubind8:SetText( "Bind 8" )
			menubind8:SetTextColor(ButtonTextColour)
			menubind8:SetPos( 450, 400 )
			menubind8:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind8.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind8.DoClick = function()
		vkBind.kb8 = soundTranslater
		print(vkBind.kb8) 
		SaveData()
		end
		local menubind9 = vgui.Create("DButton", Frame)
			menubind9:SetText( "Bind 9" )
			menubind9:SetTextColor(ButtonTextColour)
			menubind9:SetPos( 450, 440 )
			menubind9:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind9.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind9.DoClick = function()
		vkBind.kb9 = soundTranslater
		print(vkBind.kb9) 
		SaveData()
		end
		
				local menubind10 = vgui.Create("DButton", Frame)
			menubind10:SetText( "Bind 10" )
			menubind10:SetTextColor(ButtonTextColour)
			menubind10:SetPos( 450, 480 )
			menubind10:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind10.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind10.DoClick = function()
		vkBind.kb10 = soundTranslater
		print(vkBind.kb10) 
		SaveData()
		end
		
				local menubind11 = vgui.Create("DButton", Frame)
			menubind11:SetText( "Bind 11" )
			menubind11:SetTextColor(ButtonTextColour)
			menubind11:SetPos( 375, 480 )
			menubind11:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind11.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind11.DoClick = function()
		vkBind.kb11 = soundTranslater
		print(vkBind.kb11) 
		SaveData()
		end
		
				local menubind12 = vgui.Create("DButton", Frame)
			menubind12:SetText( "Bind 12" )
			menubind12:SetTextColor(ButtonTextColour)
			menubind12:SetPos( 300, 480 )
			menubind12:SetSize( ScrW() * 60/1920, ScrH() * 30/1080 )
			menubind12.Paint = function( self, w, h )
				draw.RoundedBox( 10, 0, 0, w, h, ButtonColor ) 
			end
		menubind12.DoClick = function()
		vkBind.kb12 = soundTranslater
		print(vkBind.kb12) 
		SaveData()
		end
		
				backB.DoClick = function()
			Button:SetVisible(true)
			Button2:SetVisible(true)
			Button4:SetVisible(true)
			Settings:SetVisible(true)
			manager:SetVisible(false)
			backB:SetVisible(false)
			menubind1:SetVisible(false)
			menubind2:SetVisible(false)
			menubind3:SetVisible(false)
			menubind4:SetVisible(false)
			menubind5:SetVisible(false)
			menubind6:SetVisible(false)
			menubind7:SetVisible(false)
			menubind8:SetVisible(false)
			menubind9:SetVisible(false)
			menubind10:SetVisible(false)
			menubind11:SetVisible(false)
			menubind12:SetVisible(false)
			playB:SetVisible(false)
			Frame:SetSize( ScrW() * 520/1920, ScrH() * 430/1080 )
		end
end	

Button4.DoClick = function()
	ReadData()
	Button4:SetVisible(false)
	Settings:SetVisible(false)
	Button2:SetVisible(false)
	Button:SetVisible(false) -- BUTTON FACTOR Y AXIS PLUS MINUS 67
	
				local backButton = vgui.Create("DButton", Frame)
		backButton:SetText( "BACK" )
		backButton:SetTextColor(ButtonTextColour)
		backButton:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		backButton:SetPos(190,73)
		backButton.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 

		local kpad1 = vgui.Create("DButton", Frame)
		kpad1:SetText( "Play Bind 1" )
		kpad1:SetTextColor(ButtonTextColour)
		kpad1:SetPos( 25, 140 )
		kpad1:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad1.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad1.DoClick = function()
		ReadData()	
		soundTranslater = vkBind.kb1
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb1 .. " / Loaded: " .. soundTranslater)
		end
			local kpad2 = vgui.Create("DButton", Frame)
		kpad2:SetText( "Play Bind 2" )
		kpad2:SetTextColor(ButtonTextColour)
		kpad2:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad2:SetPos(190,140)
		kpad2.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad2.DoClick = function()
		soundTranslater = vkBind.kb2
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb2 .. " / Loaded: " .. soundTranslater)
		end
			local kpad3 = vgui.Create("DButton", Frame)
		kpad3:SetText( "Play Bind 3" )
		kpad3:SetTextColor(ButtonTextColour)
		--kpad3:SetPos( 338‬, 140 )
		kpad3:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad3:SetPos(355,140)
		kpad3.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad3.DoClick = function()
		soundTranslater = vkBind.kb3
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb3 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad4 = vgui.Create("DButton", Frame)
		kpad4:SetText( "Play Bind 4" )
		kpad4:SetTextColor(ButtonTextColour)
		kpad4:SetPos( 25, 207 )
		kpad4:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad4.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad4.DoClick = function()
		soundTranslater = vkBind.kb4
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb4 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad5 = vgui.Create("DButton", Frame)
		kpad5:SetText( "Play Bind 5" )
		kpad5:SetTextColor(ButtonTextColour)
		kpad5:SetPos( 190, 207 )
		kpad5:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad5.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad5.DoClick = function()
		soundTranslater = vkBind.kb5
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb5 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad6 = vgui.Create("DButton", Frame)
		kpad6:SetText( "Play Bind 6" )
		kpad6:SetTextColor(ButtonTextColour)
		kpad6:SetPos( 355, 207 )
		kpad6:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad6.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad6.DoClick = function()
		soundTranslater = vkBind.kb6
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb6 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad7 = vgui.Create("DButton", Frame)
		kpad7:SetText( "Play Bind 7" )
		kpad7:SetTextColor(ButtonTextColour)
		kpad7:SetPos( 25, 274 )
		kpad7:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad7.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad7.DoClick = function()
		soundTranslater = vkBind.kb7
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb7 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad8 = vgui.Create("DButton", Frame)
		kpad8:SetText( "Play Bind 8" )
		kpad8:SetTextColor(ButtonTextColour)
		kpad8:SetPos( 190, 274 )
		kpad8:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad8.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad8.DoClick = function()
		soundTranslater = vkBind.kb8
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb8 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad9 = vgui.Create("DButton", Frame)
		kpad9:SetText( "Play Bind 9" )
		kpad9:SetTextColor(ButtonTextColour)
		kpad9:SetPos( 355, 274 )
		kpad9:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad9.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad9.DoClick = function()
		soundTranslater = vkBind.kb9
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb9 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad10 = vgui.Create("DButton", Frame)
		kpad10:SetText( "Play Bind 10" )
		kpad10:SetTextColor(ButtonTextColour)
		kpad10:SetPos( 25, 341 )
		kpad10:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad10.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad10.DoClick = function()
		soundTranslater = vkBind.kb10
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb10 .. " / Loaded: " .. soundTranslater)
		end
		
					local kpad11 = vgui.Create("DButton", Frame)
		kpad11:SetText( "Play Bind 11" )
		kpad11:SetTextColor(ButtonTextColour)
		kpad11:SetPos( 190, 341 )
		kpad11:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad11.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad11.DoClick = function()
		soundTranslater = vkBind.kb11
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb11 .. " / Loaded: " .. soundTranslater)
		end
		
			local kpad12 = vgui.Create("DButton", Frame)
		kpad12:SetText( "Play Bind 12" )
		kpad12:SetTextColor(ButtonTextColour)
		kpad12:SetPos( 355, 341 )
		kpad12:SetSize( ScrW() * 141/1920, ScrH() * 57/1080 )
		kpad12.Paint = function( self, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, ButtonColor ) end 
		kpad12.DoClick = function()
		soundTranslater = vkBind.kb12
		playASong(soundTranslater)
		print("Playing: " .. vkBind.kb12 .. " / Loaded: " .. soundTranslater)
		end
		
	backButton.DoClick = function()
		backButton:SetVisible (false)
		kpad9:SetVisible(false)
		kpad10:SetVisible(false)
		kpad11:SetVisible(false)
		kpad12:SetVisible(false)
		kpad8:SetVisible(false)
		kpad7:SetVisible(false)
		kpad6:SetVisible(false)
		kpad5:SetVisible(false)
		kpad4:SetVisible(false)
		kpad3:SetVisible(false)
		kpad2:SetVisible(false)
		kpad1:SetVisible(false)
		Button2:SetVisible(true)
		Settings:SetVisible(true)
		Button:SetVisible(true)
		Button4:SetVisible(true)
	end
end
end
concommand.Add("sb_open",function() helloSound() end) 

hook.Add("Think", "input_sbkey", function()if input.IsKeyDown(KEY_F10) and !ignition then
		ignition = true
		helloSound() 
		elseif (!input.IsKeyDown(KEY_F10)) and ignition then
		ignition = false 
		end 
		end)
