on run input
	tell application "System Events"
		tell process "Logic Pro X"
			tell menu item "Settings" of menu 1 of menu bar item "Logic Pro X" of menu bar 1
				click menu item 14 of menu 1
			end tell
		end tell
		click button "Reset & Rescan Selection" of window "Plug-In Manager" of application process "Logic Pro X"
	end tell
end run