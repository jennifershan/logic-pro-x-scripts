on run input
	tell application "System Events"
		tell process "Logic Pro X"
			tell menu item "Settings" of menu 1 of menu bar item "Logic Pro" of menu bar 1
				click menu item 14 of menu 1
			end tell
		end tell
		set manufacturer to item 1 of input
		set plugin to item 2 of input
		repeat with r in rows of table 1 of scroll area 2 of splitter group 1 of splitter group 1 of window "Plug-In Manager" of process "Logic Pro X"
			set t to value of static text of first UI element of r
			if item 1 of t is equal to manufacturer then select r
		end repeat
		repeat with r in rows of table 1 of scroll area 2 of splitter group 1 of window "Plug-In Manager" of process "Logic Pro X"
			if value of text field 1 of r is equal to plugin then select r
		end repeat
		click button "Reset & Rescan Selection" of window "Plug-In Manager" of process "Logic Pro X"
		click button "Done" of window "Plug-In Manager" of process "Logic Pro X"
		if (count input) = 3 then
			if item 3 of input is equal to "-c" then
				tell application "Logic Pro X"
					activate
				end tell
				click button 1 of window "Audio Unit Validation Result" of process "Logic Pro X"
			end if
		end if
	end tell
end run