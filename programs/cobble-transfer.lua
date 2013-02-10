-- Script: cobble-transfer.lua
--
-- Description: travel between cobble chests hooked to an
-- infinite cobble generator (see the "cobble" script) and
-- a set of chests/turtles that auto-craft minium recipes
--
-- Author: Matthew Batchelder (borkweb)
-- Author URI: http://github.com/borkweb

bork_cc.loadAPI('turtle-plus')

local t = turtle

function all( action )
	for i=1,16,1 do
		t[action]( i, 'down' )
	end
end

while true do
	t.move('up', 1)
	t.move('back', 10)
	t.turnLeft()
	t.move('forward', 1)
	t.move('down', 2)
	
	all('load')
	t.move('forward', 1)

	all('load')
	t.move('forward', 1)

	all('load')
	t.move('back', 2)
	t.move('up', 2)
	t.move('back', 1)
	t.turnRight()
	t.move('forward', 10)
	t.move('down', 1)

	all('dump')

	sleep(0.1)
end
