on run argv
	tell application "iPhoto"
		set vAlbum to first item of (get every album whose name is (item 1 of argv))
		set vPhotos to get every photo in vAlbum
		
		set output to ""
		
		repeat with vPhoto in vPhotos
			set output to output & �
				"altitude: " & altitude of vPhoto & "
" & �
				"latitude: " & latitude of vPhoto & "
" & �
				"longitude: " & longitude of vPhoto & "
" & �
				"name: " & name of vPhoto & "
" & �
				"date: " & date of vPhoto & "
" & �
				"path: " & original path of vPhoto & "
" & �
				"title: " & title of vPhoto & "
------
" & comment of vPhoto & "
------------
"
		end repeat
		
		return output
	end tell
end run