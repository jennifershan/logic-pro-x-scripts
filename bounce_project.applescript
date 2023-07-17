use scripting additions

on run input
	if (count input) = 2 then
		bounce given mode:item 1 of input, saveas:item 2 of input
	else
		if {"Realtime", "Offline"} contains item 1 of input then
			bounce given mode:item 1 of input
		else
			bounce given saveas:item 1 of input
		end if
	end if
end run

on bounce given mode:usermode : "Offline", saveas:usersaveas : missing value
	tell application "System Events"
		tell process "Logic Pro X"
			set frontmost to true
			keystroke "b" using command down
			if not (value of checkbox 1 of UI element 1 of row 1 of table 1 of scroll area 1 of window 1 as boolean) then
				click checkbox 1 of UI element 1 of row 1 of table 1 of scroll area 1 of window 1
			end if
			if (usermode is equal to "Realtime") then
				click radio button "Realtime" of window 1
			end if
			if (usermode is equal to "Offline") then
				click radio button "Offline" of window 1
			end if
			click pop up button "Normalize:" of window 1
			click menu item "Off" of menu of pop up button of window 1
			click button "OK" of window 1
			if not (usersaveas is equal to missing value) then
				click text field "Save As:" of window 1
				keystroke usersaveas
			end if
			click pop up button "Where:" of window 1
			click menu item "Downloads" of menu of pop up button of window 1
			click button "Bounce" of window 1
			if (exists of button "Save" of window 1) then
				click button "Save" of window 1
			end if
		end tell
	end tell
end bounce