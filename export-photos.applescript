on run argv
	
	tell application "Photos"
		
		set albumName to (item 1 of argv)
		set testingName to "Instagram"
		set finalVar to albumName
		set vAlbum to first item of (get every album whose name is finalVar)
		set vPhotos to get every media item in vAlbum
		
		set theFolderName to finalVar
		set theDestinationRootFolder to "/Volumes/Bytes of Terror 2/Website local copy/Jekyll/Galleries/" & theFolderName as POSIX file as text
		set phpRootFolder to "/Volumes/Bytes of Terror 2/Website local copy/Jekyll/Galleries/" & theFolderName as text
		--Alternative
		
		--set theDestinationRootFolder to "/Users/[username]/Desktop/Exported Photos" as POSIX file as text -- sets the destination folder (use a valid path)  
		tell application "Finder"
			if not (exists theDestinationRootFolder) then
				my makeFolder(theDestinationRootFolder)
				log "Created root folder:" & theDestinationRootFolder
			else
				log "Root Folder already exists:" & theDestinationRootFolder
			end if
		end tell
		export vPhotos to (theDestinationRootFolder as alias) with using originals
		
		
		set output to ""
		repeat with vPhoto in vPhotos
			set locationList to location of vPhoto
			set output to output & Â
				"altitude: " & altitude of vPhoto & "
" & Â
				"latitude: " & item 1 of locationList & "
" & Â
				"longitude: " & item 2 of locationList & "
" & Â
				"name: " & name of vPhoto & "
" & Â
				"date: " & date of vPhoto & "
" & Â
				"path: " & phpRootFolder & "/" & filename of vPhoto & "
" & Â
				"id: " & id of vPhoto & "
" & Â
				"title: " & filename of vPhoto & "
------
" & description of vPhoto & "
------------
"
		end repeat
		
		return output
	end tell
end run
on makeFolder(tPath)
	do shell script "mkdir -p " & quoted form of (POSIX path of tPath)
end makeFolder