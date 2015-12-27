-- This script pauses playback when minimizing the window, and resumes playback
-- if it's brought back again. If the player was already paused when minimizing,
-- then try not to mess with the pause state.

local did_minimize = false

mp.observe_property("window-minimized", "bool", function(name, value)
    local pause = mp.get_property_native("pause")
    if value == true then
		mp.set_property_native("pause", true)
    elseif value == false then
		mp.set_property_native("pause", false)
		mp.set_property_native("ontop", true)
    end
end)
