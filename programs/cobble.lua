-- Script: cobble-transfer.lua
--
-- Description: this is a simple infinite cobble
-- script for a mining turtle that remains stationary,
-- mines in front of him, and drops cobble down
--
-- Author: Matthew Batchelder (borkweb)
-- Author URI: http://github.com/borkweb

while true do
	turtle.dig()
	turtle.dropDown()
	sleep(0.2)
end
