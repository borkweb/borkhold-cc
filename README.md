Borkhold ComputerCraft scripts
===========

These are Minecraft ComputerCraft scripts meant for use in my personal
minecraft area, _Borkhold_

## Installation

1. First, install [bork-cc](https://github.com/borkweb/bork-cc) APIs and programs (they are a pre-req)
1. Open the lua interpreter on the in-game computer: `lua`
1. Enter the following snippet to download the installation:
	 `loadstring(http.get('https://raw.github.com/borkweb/borkhold-cc/master/bootstrap.lua').readAll())()`
1. Follow the instructions given by the installer and you should be good to go!

## Scripts

### `borkhold/programs/cobble`

I have an inifinite source of cobblestone in Borkhold (a few, actually)
that are identically set up.  Flowing water to one side with a single
block of lava to the other side (with a space between them &mdash; where
the cobble is created).  I place a minig turtle in front of the cobble
with a chest directly below him.  Running this uber-simple program will
have him mine the cobble in front of him and drop the cobble into the
chest below.

The cobble is then pulled from the chests via a redstone engine and sent
along a pipe system to another series of chests for storage/pickup by
another turtle.

### `borkhold/programs/cobble-transfer`

Using the `bork-cc/programs/craft` program, I have an infinite (though
slow) diamond factory run by crafty turtles with minium stones.  Because
those turtles are focused on crafting cobble -> flint -> clay -> clay
blocks -> iron -> gold -> diamond, I have another turtle that brings
cobblestone to a chest for production.  This is the script that drives
him.  It is highly tailored to the layout of Borkhold.

## Credits
The installer and bootstrap scripts were cloned from @damien at https://github.com/damien/cc-scripts
