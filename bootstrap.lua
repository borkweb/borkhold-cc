-- Name: bootstrap
-- Source: /bork-cc/bootstrap.lua
-- The bork-cc installer, shamelessly taken from the awesome repository by
-- @damien: https://github.com/damien/cc-scripts

-- First thing's first: save the installer to root of the current
-- computer. We want the user to be able to resume this process
-- if the install fails.
fs.makeDir("/borkhold")
bootstrap = fs.open("/borkhold/bootstrap", "w")
bootstrapConnection = http.get("https://raw.github.com/borkweb/borkhold-cc/master/bootstrap.lua")

assert(bootstrap, "Unable to save installer to disk! Please make sure your in-game computer has space available and try again!")
assert(bootstrapConnection, "Unable to download installer components! Is your internet working? See if you can access https://raw.github.com/damien/cc-scripts/master/bootstrap.lua")

bootstrap.write(bootstrapConnection.readAll())
bootstrapConnection.close()
bootstrap.close()

-- A manifest of all the APIs and programs the installer will include
-- by default.
programs = {
	"cobble",
	"clay",
	"clay-block",
	"diamond",
	"flint",
	"gold",
	"iron",
	"up-front",
	"down-front",
	"down-up"
}

-- Clear the screen and reset the cursor position
function nextScreen()
  term.clear()
  term.setCursorPos(1,1)
end

-- Splash screen
nextScreen()
print("borkhold installer has been initialized!")
sleep(1)
nextScreen()

-- Show the user what's going to be installed
print("A total of " .. #programs .. " programs will be installed.")

-- Give the user the option to opt-out before we start
-- installing stuff
print()
print("Type 'yes' and hit return to continue,")
print("enter anything else to abort:")

if read() ~= "yes" then
  nextScreen()
  print("You have exited the borkhold installer!")
  print()
  print("You can run the installer again from")
  print("/borkhold/bootstrap")
  print()
  print("If you'd like to remove borkhold,")
  print("simply delete /borkhold")
  return
end

-- Install all the things!
--
-- This is pretty much just a selective copy from the latest
-- code on Github.
function install(path)
  local url = "https://raw.github.com/borkweb/borkhold-cc/master/" .. path .. ".lua"
  local installPath = "/borkhold/" .. path
  local updated = fs.exists(installPath)

  print("Downloading " .. path .. " ...")
  local conn = http.get("https://raw.github.com/borkweb/borkhold-cc/master/" .. path .. ".lua")
  local file = fs.open(installPath, "w")

  assert(conn, "Unable to download " .. path .. " - aborting!")
  assert(file, "Unable to save " .. path .. " to " .. installPath .. " - aborting!")

  file.write(conn.readAll())

  file.close()
  conn.close()

  if updated then
    print("Updated " .. path)
  else
    print("Installed " .. path)
  end
end

function configureFactory()
	local scripts = {
		"flint",
		"clay",
		"clay-block",
		"iron",
		"gold",
		"diamond",
		"down-front",
		"up-front",
		"down-up"
	}

	local had = false

	for i = 1, #scripts do
		had = fs.exists("/" .. scripts[i])

		-- Clobber any previous startup script
		if had then
			fs.delete("/" .. scripts[i])
		end

		fs.copy("/borkhold/programs/" .. scripts[i], "/" .. scripts[i])
	end
end

nextScreen()
print("Starting installation...")
print()

-- Install all of our programs
fs.makeDir("/borkhold/programs")
for i = 1, #programs do
  install("programs/"..programs[i])
end

configureFactory()

print()
print("Installation completed! Enjoy borkhold!")
print()
print("Your computer will reboot in 3 seconds!")
sleep(3)
os.reboot()
