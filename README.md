##Installation:

    $ php composer install

You might also need PHP 5.5.

**Note:** I couldn't get *Normalizer* working on 10.11, so you might be on your own. 

The `convert-photos.php` has a version that doesn't use *Normalizer*


##Photos.app:
	$ osascript export-photos.applescript 'Instagram' |  php convert-photos.php instagram --export 96x96 --export 200x200 --export 640 --export 1280
or:

	$ osascript export-photos.applescript 'Instagram' |  php convert.php instagram --export 96x96 --export 200x200 --export 640 --export 1280
	
##iPhoto.app:
	$ osascript ../jekyll-gallery/export-iphoto.applescript 'London-Iceland Trip' | \ 
	php ../jekyll-gallery/convert.php 2014-london-iceland-trip \
	 --export 96x96 --export 200x200 --export 640 --export 1280
