tell application "System Events"
	set volume input volume 0
end tell
tell application "System Preferences"
	activate
	set current pane to pane id "com.apple.preference.sound"
end tell
tell application "System Events"
	tell process "System Preferences"
		set frontmost to true
		click radio button "input" of tab group 1 of window "Sound"
		perform action "AXDecrement" of slider 1 of group 2 of tab group 1 of window "Sound"
	end tell
end tell
tell application "System Preferences"
	quit
end tell
