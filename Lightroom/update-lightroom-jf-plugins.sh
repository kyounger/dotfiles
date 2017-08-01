#!/usr/bin/env zsh

set -e
setopt +o nomatch

items=(
	data-explorer
	metadatawrangler
	megapixel-sort
	metadata-viewer
	flickr
	workflow-delete-options
	folder-status
	smart-preview-support
	bag-o-goodies
	photosafe
)

LIGHTROOM_PLUGIN_DIR="/Users/kenny/Dropbox/Lightroom/Lightroom Plugins"

ls -al "$LIGHTROOM_PLUGIN_DIR"

#clear jfriedl plugins
cd "$LIGHTROOM_PLUGIN_DIR"
rm -rf *-jfriedl*

for x in $items; do;
	rm -f "$x.zip"
	curl --silent --show-error \
		-H 'Referer: http://regex.info/LightroomPlugins2/releases/' http://regex.info/LightroomPlugins2/releases/$x.zip \
		> "$x.zip"
	unzip "$x.zip"
	rm -f "$x.zip"
done;

ls -al "$LIGHTROOM_PLUGIN_DIR"
