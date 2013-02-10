-- this is a simple infinite cobble script for
-- a mining turtle that remains stationary,
-- mines in front of him, and drops cobble down

while true do
	turtle.dig()
	turtle.dropDown()
	sleep(0.1)
end
